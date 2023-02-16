# Sumo logic log ingestion automation 
## Main Goal 
1. Create Sumologic **sources** with **source category** automatically.
2. Deploy and configure fluent-bit on kubernetes clusters to send logs to sumologic sources.
#### It will be achived by creating two modules in terraform 
1. Sumologic module
2. Fluent-bit module 
### Sumo logic terraform module
This module will create  http sources in Sumologic under certian hosted collector
```
resource "sumologic_http_source" "http_source" {
  name         = var.http_source_name
  category     = var.category
  collector_id = var.collector_id
  host_name    = var.http_source_name
}
```
### Fluent-bit module
This module 
1. Will deploy fluent-bit helm chart into certain kubernetes cluster
#### This helm chart will
   1. Install and configure fluent-bit  ```daemonset, configmaps, clusterrole, clusterrolebinding, CluserIP service ```
   2. Using ```fluent-bit-helm-values.yaml```
   3. ```configmap``` responsible for fluent-bit conifguration and creating (```INPUT, FILTER, PARSER, OUTPUT```) for each service
         * INPUT:  tail of container logs
         * OUTPUT: Send logs to Sumologic https sources
            * Example of https sources endpoint 
               ``` https://endpoint1.collection.sumologic.com/receiver/v1/http/XXXXXXX ```

#### main.tf 
```
data "sumologic_http_source" "http_sources" {
  for_each    = var.data_sources
  collector_id = each.value["collector_id"]
  name = each.value["http_source_name"]

}

locals {

 apps_info = {for k, http_source_apps in data.sumologic_http_source.http_sources : k => substr(http_source_apps.url, -138, -1) }

}

# Example of output 
#    apps_info = {
#        "catalog" = "/receiver/v1/http/XXXXXX"
#        "category" = "/receiver/v1/http/XXXXXX"
#    }

resource "helm_release" "fluent-bit" {
  name            = "fluent-bit"
  repository      = "https://fluent.github.io/helm-charts"
  chart           = "fluent-bit"
  version         = "0.20.6"
  namespace       = var.fluent_bit_namespace
  cleanup_on_fail = true
  timeout         = 780

  values = [
    "${file("${path.module}/fluent-bit-helm-values.yaml")}",
    templatefile("${path.module}/config.yaml.tpl", {
      config = local.apps_info
      cluster_name = var.cluster_name
      location    = var.location
      project_id  = var.project_id
    })
  ]
}

```
#### fluent-bit-helm-values.yaml
```
# kind -- DaemonSet or Deployment
kind: DaemonSet

image:
  repository: cr.fluentbit.io/fluent/fluent-bit
  # Overrides the image tag whose default is {{ .Chart.AppVersion }}
  tag: "1.9.7"
  pullPolicy: Always

serviceAccount:
  create: true
  annotations: {}
  name:

rbac:
  create: true
  nodeAccess: false

service:
  type: ClusterIP
  port: 2020

flush: 1

metricsPort: 2020

logLevel: info

## https://docs.fluentbit.io/manual/administration/configuring-fluent-bit/configuration-file
config:
  service: |
    [SERVICE]
        Daemon Off
        Flush {{ .Values.flush }}
        Log_Level {{ .Values.logLevel }}
        Parsers_File custom_parsers.conf
        Parsers_File parsers.conf
        HTTP_Server On
        HTTP_Listen 0.0.0.0
        HTTP_Port {{ .Values.metricsPort }}
        Health_Check On
    @INCLUDE sumologic_*.conf

 customParsers: |    
    [PARSER]
        Name docker_no_time
        Format json
        Time_Keep Off
        Time_Key @timestamp
        Time_Format %Y-%m-%dT%H:%M:%S.%L
        
    [PARSER]
        Name cri_custom_logs
        Format regex
        Regex time="(?<time>[^ ]+)" stream="(?<stream>stdout|stderr)" textPayload="(?<log>.*)"
        Time_Key    time
        Time_Format %Y-%m-%dT%H:%M:%S.%L%z

    [PARSER]
        Name    kube_custom_tag
        Format  regex
        Regex   ^(?<namespace_name>[^_]+)\.(?<container_name>.+)\.(?<pod_name>[a-z0-9](?:[-a-z0-9]*[a-z0-9])?(?:\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*)\.(?<docker_id>[a-z0-9]{64})-$
    
    [MULTILINE_PARSER]
        name          multiline_regex
        type          regex
        flush_timeout 1000
        # Regex rules for multiline parsing
        # ---------------------------------
        #
        # configuration hints:
        #
        #  - first state always has the name: start_state
        #  - every field in the rule must be inside double quotes
        #
        # rules   |   state name   | regex pattern                   | next state name
        # --------|----------------|--------------------------------------------------
        rule         "start_state"   "/^(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}.\d{3})(.*)$/"      "cont"
        rule         "cont"          "/^(?!(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}.\d{3}))(.*)$/"  "cont"

  extraFiles: {}
#     example.conf: |
#       [OUTPUT]
#           Name example
#           Match foo.*
#           Host bar
```
#### config.yaml.tpl
```
config:
  extraFiles:
  %{for app_name, source_end_point in config }
     sumologic_${app_name}.conf: |
        [INPUT]
           Name            tail
           Path             /var/log/containers/*${app_name}*.log
           Tag              kube.<namespace_name>.<container_name>.<pod_name>.<docker_id>-
           Tag_Regex        (?<pod_name>[a-z0-9](?:[-a-z0-9]*[a-z0-9])?(?:\\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*)_(?<namespace_name>[^_]+)_(?<container_name>.+)-(?<docker_id>[a-z0-9]{64})\.log$
           Mem_Buf_Limit    100MB
           Skip_Long_Lines   On 
           DB                /var/log/flb.db
           Buffer_Chunk_Size 100k
           Buffer_Max_Size 1M
           Skip_Empty_Lines On

        [FILTER]
           name                  multiline
           match                 kube.*${app_name}.*
           multiline.key_content textPayload
           multiline.parser      multiline_regex
           #Emitter_Mem_Buf_Limit 100MB
           buffer                off

        [FILTER]
           Name kubernetes
           Match kube.*
           Kube_Tag_Prefix kube.
           Regex_Parser kube_custom_tag
           Merge_Log On
           Merge_Log_Trim On
           Keep_Log Off
           Annotations Off
           Labels Off
           K8S-Logging.Parser On
           K8S-Logging.Exclude Off

        [FILTER]
           Name modify
           Match kube.*
           Add cluster_name ${cluster_name}
           Add location ${location}
           Add project_id ${project_id}

        [FILTER]
           Name nest
           Match kube.*
           Operation lift
           Nested_under kubernetes

        [FILTER]
           Name nest
           Match kube.*
           Operation nest
           Wildcard pod_name*
           Wildcard namespace_name*
           Wildcard container_name*
           Wildcard cluster_name* 
           Wildcard location* 
           Wildcard project_id*     
           Nest_under labels

        [FILTER]
           Name nest
           Match kube.*
           Operation nest
           Wildcard labels*
           Nest_under resource


        [FILTER]
           Name   modify
           Match  kube.*
           Remove container_image
           Remove docker_id
           Remove pod_id
           Remove container_hash
           Remove host
           Remove stream
           Rename log textPayload
           Remove time
           
        [OUTPUT]
           Name             http
           Match            kube.*.${app_name}.*
           Host             endpoint1.collection.sumologic.com
           Port             443
           URI              ${source_end_point}
           Format           json_lines
           Json_date_key    timestamp
           TLS              on
           Json_date_format iso8601
%{ endfor ~}
# The config volume is mounted by default, either to the existingConfigMap value, or the default of "fluent-bit.fullname"
```
### Example of created files by configmap
```
root@fluent-bit-2-7z6f4:/fluent-bit/etc# ls -l
total 220
-rw-r--r-- 1 root root    122 Sep  7 12:19 custom_parsers.conf
-rw-r--r-- 1 root root    231 Sep  7 12:19 fluent-bit.conf
-rw-r--r-- 1 root root   4623 Aug  9 06:55 parsers.conf
-rw-r--r-- 1 root root    584 Aug  9 06:55 parsers_ambassador.conf
-rw-r--r-- 1 root root    226 Aug  9 06:55 parsers_cinder.conf
-rw-r--r-- 1 root root   7149 Aug  9 06:55 parsers_extra.conf
-rw-r--r-- 1 root root    240 Aug  9 06:55 parsers_java.conf
-rw-r--r-- 1 root root   2954 Aug  9 06:55 parsers_openstack.conf
-rw-r--r-- 1 root root     45 Aug  9 06:55 plugins.conf
-rw-r--r-- 1 root root 162672 Aug  9 07:04 schema.json
-rw-r--r-- 1 root root   1444 Sep  7 12:19 sumologic_catalog.conf
-rw-r--r-- 1 root root   1450 Sep  7 12:19 sumologic_category.conf
-rw-r--r-- 1 root root   1456 Sep  7 12:19 sumologic_composite.conf
```
### Example of config maps
```
Name:         fluent-bit
Namespace:    fluent-bit
Labels:       app.kubernetes.io/instance=fluent-bit
              app.kubernetes.io/managed-by=Helm
              app.kubernetes.io/name=fluent-bit
              app.kubernetes.io/version=1.9.7
              helm.sh/chart=fluent-bit-0.20.6
Annotations:  meta.helm.sh/release-name: fluent-bit
              meta.helm.sh/release-namespace: fluent-bit
Data
====
sumologic_ideaboard.conf:
----
[INPUT]
   Name            tail
   Path             /var/log/containers/*ideaboard*.log
   Tag              kube.<namespace_name>.<container_name>.<pod_name>.<docker_id>-
   Tag_Regex        (?<pod_name>[a-z0-9](?:[-a-z0-9]*[a-z0-9])?(?:\\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*)_(?<namespace_name>[^_]+)_(?<container_name>.+)-(?<docker_id>[a-z0-9]{64})\.log$
   Mem_Buf_Limit    100MB
   Skip_Long_Lines   On 
   DB                /var/log/flb.db
   Buffer_Chunk_Size 100k
   Buffer_Max_Size 1M
   Skip_Empty_Lines On
[FILTER]
   name                  multiline
   match                 kube.*ideaboard.*
   multiline.key_content textPayload
   multiline.parser      multiline_regex
   #Emitter_Mem_Buf_Limit 100MB
   buffer                off
[FILTER]
   Name kubernetes
   Match kube.*
   Kube_Tag_Prefix kube.
   Regex_Parser kube_custom_tag
   Merge_Log On
   Merge_Log_Trim On
   Keep_Log Off
   Annotations Off
   Labels Off
   K8S-Logging.Parser On
   K8S-Logging.Exclude Off
[FILTER]
   Name modify
   Match kube.*
   Add cluster_name e4gd01appkub001
   Add location us-east4-a
   Add project_id sharedinfra-host-test
[FILTER]
   Name nest
   Match kube.*
   Operation lift
   Nested_under kubernetes
[FILTER]
   Name nest
   Match kube.*
   Operation nest
   Wildcard pod_name*
   Wildcard namespace_name*
   Wildcard container_name*
   Wildcard cluster_name* 
   Wildcard location* 
   Wildcard project_id*     
   Nest_under labels
[FILTER]
   Name nest
   Match kube.*
   Operation nest
   Wildcard labels*
   Nest_under resource
[FILTER]
   Name   modify
   Match  kube.*
   Remove container_image
   Remove docker_id
   Remove pod_id
   Remove container_hash
   Remove host
   Remove stream
   Rename log textPayload
   Remove time
[OUTPUT]
   Name             http
   Match            kube.*.ideaboard.*
   Host             endpoint1.collection.sumologic.com
   Port             443
   URI              /receiver/v1/http/XXXXXXXX
   Format           json_lines
   Json_date_key    timestamp
   TLS              on
   Json_date_format iso8601
sumologic_beyondplusinfo.conf:
----
[INPUT]
   Name            tail
   Path             /var/log/containers/*beyondplusinfo*.log
   Tag              kube.<namespace_name>.<container_name>.<pod_name>.<docker_id>-
   Tag_Regex        (?<pod_name>[a-z0-9](?:[-a-z0-9]*[a-z0-9])?(?:\\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*)_(?<namespace_name>[^_]+)_(?<container_name>.+)-(?<docker_id>[a-z0-9]{64})\.log$
   Mem_Buf_Limit    100MB
   Skip_Long_Lines   On 
   DB                /var/log/flb.db
   Buffer_Chunk_Size 100k
   Buffer_Max_Size 1M
   Skip_Empty_Lines On
[FILTER]
   name                  multiline
   match                 kube.*beyondplusinfo.*
   multiline.key_content textPayload
   multiline.parser      multiline_regex
   #Emitter_Mem_Buf_Limit 100MB
   buffer                off
[FILTER]
   Name kubernetes
   Match kube.*
   Kube_Tag_Prefix kube.
   Regex_Parser kube_custom_tag
   Merge_Log On
   Merge_Log_Trim On
   Keep_Log Off
   Annotations Off
   Labels Off
   K8S-Logging.Parser On
   K8S-Logging.Exclude Off
[FILTER]
   Name modify
   Match kube.*
   Add cluster_name e4gd01appkub001
   Add location us-east4-a
   Add project_id sharedinfra-host-test
[FILTER]
   Name nest
   Match kube.*
   Operation lift
   Nested_under kubernetes
[FILTER]
   Name nest
   Match kube.*
   Operation nest
   Wildcard pod_name*
   Wildcard namespace_name*
   Wildcard container_name*
   Wildcard cluster_name* 
   Wildcard location* 
   Wildcard project_id*     
   Nest_under labels
[FILTER]
   Name nest
   Match kube.*
   Operation nest
   Wildcard labels*
   Nest_under resource
[FILTER]
   Name   modify
   Match  kube.*
   Remove container_image
   Remove docker_id
   Remove pod_id
   Remove container_hash
   Remove host
   Remove stream
   Rename log textPayload
   Remove time
[OUTPUT]
   Name             http
   Match            kube.*.beyondplusinfo.*
   Host             endpoint1.collection.sumologic.com
   Port             443
   URI              /receiver/v1/http/XXXXXX
   Format           json_lines
   Json_date_key    timestamp
   TLS              on
   Json_date_format iso8601
custom_parsers.conf:
----
[PARSER]
    Name docker_no_time
    Format json
    Time_Keep Off
    Time_Key @timestamp
    Time_Format %Y-%m-%dT%H:%M:%S.%L
[PARSER]
    Name cri_custom_logs
    Format regex
    Regex time="(?<time>[^ ]+)" stream="(?<stream>stdout|stderr)" textPayload="(?<log>.*)"
    Time_Key    time
    Time_Format %Y-%m-%dT%H:%M:%S.%L%z
[PARSER]
    Name    kube_custom_tag
    Format  regex
    Regex   ^(?<namespace_name>[^_]+)\.(?<container_name>.+)\.(?<pod_name>[a-z0-9](?:[-a-z0-9]*[a-z0-9])?(?:\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*)\.(?<docker_id>[a-z0-9]{64})-$
[MULTILINE_PARSER]
    name          multiline_regex
    type          regex
    flush_timeout 1000
    # Regex rules for multiline parsing
    # ---------------------------------
    #
    # configuration hints:
    #
    #  - first state always has the name: start_state
    #  - every field in the rule must be inside double quotes
    #
    # rules   |   state name   | regex pattern                   | next state name
    # --------|----------------|--------------------------------------------------
    rule         "start_state"   "/^(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}.\d{3})(.*)$/"      "cont"
    rule         "cont"          "/^(?!(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}.\d{3}))(.*)$/"  "cont"
    .......
```
# Deployment
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
3. https://registry.terraform.io/providers/SumoLogic/sumologic/latest/docs




