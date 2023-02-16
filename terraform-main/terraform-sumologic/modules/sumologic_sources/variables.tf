variable "category" {
  type        = string
  description = "SumoLogic Source Category"
}
variable "collector_id" {
  type        = string
  description = "SumoLogic Collector ID"
}
variable "http_source_name" {
  type        = string
  description = "SumoLogic HTTP Source Name"
}
variable "timezone" {
  type        = string
  description = "SumoLogic HTTP Source TimeZone"
}
variable "filters" {}