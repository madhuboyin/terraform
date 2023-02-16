# Setup Fluent-Bit and SumoLogic Variables

variable "fluent_bit_namespace" {
  type        = string
  description = "Namespace Of Fluent-bit Daemonset and Configuration "
  sensitive   = true
}

variable "sources" {}

variable "location" {
  type        = string
  description = "Kubernetes Cluster Location. Ex, us-east4-a"
  sensitive   = true
}

variable "cluster_name" {
  type        = string
  description = "Kubernetes Cluser name. EX.e4gd03appkub001"
  sensitive   = true
}

variable "project_id" {
  type        = string
  description = "Google Project ID.Ex,sharedinfra-host-test"
  sensitive   = true
}
