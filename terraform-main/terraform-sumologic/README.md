# Sumo logic log ingestion automation 
## Main Goal 
1. Create Sumologic **sources** with **source category** automatically.
2. Deploy and configure fluent-bit on kubernetes clusters to send logs to sumologic sources.
## Prequests
1. Sumologic account with Access_id and Access_key.
2. ID of the Sumologic Collector, sources will be created inside it.
3. Create namespace for ```fluent-bit``` to install all fluent-bit resources inside it. 
   * Used namespace: ```fluent-bit```
## Deployment WorkFlow
* Creating ```terraform.tfvars``` file under ```clusters/(prod|non_prod)/{cluster_name}/``` that will contain sumologic sources data.
* When making ```terraform apply```, the code will create sumologic sources inside certain collector defined in ```terraform.tfvars ``` then it will update the fluent-bit configuration with sumologic endpoints and deploy them into kubernetes cluster.
## Repository structure
```
   .
   ├── clusters                                 #  Contains terraform.tfvars file for each cluster. It has two folders prod and non_prod
   │   ├── non_prod
   │   │   ├── e4gd01appkub001
   │   │   │   └── terraform.tfvars
   │   │   ├── e4gd03appkub001
   │   │   │   └── terraform.tfvars
   │   │   ├── e4ge01appkub001
   │   │   │   └── terraform.tfvars
   │   │   └── e4gt01appkub001
   │   │       └── terraform.tfvars
   │   │   └── .....
   │   │       └── ......
   │   └── prod
   ├── modules                                
   │   ├── fluent-bit                           # This module use fluent-bit helm chart.
   │   │   ├── config.yaml.tpl                  # Template file for creating fluent-bit configurations for each source.
   │   │   ├── fluent-bit-helm-values.yaml      # The main helm chart vaules.yaml file.
   │   │   ├── main.tf
   │   │   ├── outputs.tf
   │   │   ├── variables.tf
   │   │   └── version.tf
   │   └── sumologic_sources                    # This module is used to create sumologic sources.
   │       ├── main.tf
   │       ├── outputs.tf
   │       ├── variables.tf
   │       └── version.tf
   ├── main.tf
   ├── backend.tf
   ├── output.tf
   ├── provider.tf
   ├── README.md
   ├── variables.tf
   └── version.tf
```
### terraform.tfvars file example
```
   #
   fluent_bit_namespace = "fluent-bit"
   location             = "us-east4-a"
   project_id           = "sharedinfra-host-test"
   cluster_name         = "e4gd03appkub001"
   # All sources should be added here
   # Collector Name: GCP-EAST4-DEV-NEW, Collector ID: 208612559
   sources = {
      // Example with default timezone and with no filters
      xt-checkout = {
         http_source_name = "e4gd03appkub001_xt-checkout",
         category         = "feo/dev03/gke/e4/xt-checkout",
         collector_id     = "208612559",
         timezone         = "",
         filters          = {}
         },
      // Example with configured timezone and filters
      tests = {
         http_source_name = "e4gd03appkub001_tests",
         category         = "feo/dev03/gke/e4/tests",
         collector_id     = "205944421",
         timezone         = "America/New_York",
         // Porcessing Rules
         filters = {
            Rule_1 = {
               name        = "exclude_info",
               filter_type = "Exclude",
               regexp      = ".*INFO \\[.*",
               },
            Rule_2 = {
               name        = "exclude_debug",
               filter_type = "Exclude",
               regexp      = "(?s).*DEBUG \\[.*(?s)",
               },
            }
      }

        .....
   }
```
## Steps for deploying
### Using Jenkins
* There are two jenkins files 
   * Jenkinsfile -> non-prod jenkinsfile
   * Jenkinsfile_Prod -> prod jenkinsfile
They are running in two different jobs for prod and nonprod. 
* Steps for deploying on jenkins
   1. Create or update the terraform.tfvars file under certian cluster
   2. If it is new cluster, add it into ```CLUSTER_NAME``` parameter in the jenkinfile

``` https://jenkins.gcp.bedbath.com/job/ecom/job/WebDevOpsOrg/job/terraform/ ```
### Manually
1. Create ```creds.json``` file in the root directory of the repo. 
   * This is service account file that have access to the backend bucket
   ```
   terraform {
      backend "gcs" {
      credentials = "./creds.json"
      }
   }
   ```   
3. Authenticate to GKE by creating ```.kubeConfig ``` file
   * Note: 
     * Helm provider in terraform will authenticate to kubernetes clustes with the kubeconfig file
        ```
           provider "helm" {
           kubernetes {
             config_path = "./.kubeConfig"
           }
         } 
         ```
4. Create or update terraform.tfvars file. 
5. Export sumologic Keys
   * ```export SUMOLOGIC_ACCESSID=""```
   * ```export SUMOLOGIC_ACCESSKEY=""```
6. Initialize the terraform with backend bucket 
   * ```terraform init -backend-config="bucket="${backend_bucket_name}"" ```
   * Bucket for non-prod ```nonprod-sumologic-terraform-state-files```, created in ```sharedinfra-host-test``` project
   * Bucket for prod ```prod-sumologic-terraform-state-files```, created in ```prod-host-project``` project
7. Create or switch to the workspace (workspace will be named like cluster name) this will create ```${clustername.tfstate}``` in the remote backend. 
   * ```terraform workspace (new|select) {CLUSTER_NAME}```
8.  check the plan of terraform 
    * ```terraform plan -var-file="terraform-sumologic/clusters/{non-prod\prod}/${CLUSET_NAME}/terraform.tfvars"```
9.  Then apply the terraform 
    *  ```terraform apply -var-file="terraform-sumologic/clusters/{non-prod\prod}/${CLUSET_NAME}/terraform.tfvars"```
## References 
1. https://github.com/fluent/helm-charts/tree/main/charts/fluent-bit
2. https://registry.terraform.io/providers/hashicorp/helm/latest/docs
3. https://registry.terraform.io/providers/SumoLogic/sumologic/latest/docsumologic/latest/docs