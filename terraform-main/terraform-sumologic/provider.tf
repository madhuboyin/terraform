provider "sumologic" {
}
provider "helm" {
  kubernetes {
    config_path = "./.kubeConfig"
  }
}