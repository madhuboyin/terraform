module "sumologic_sources" {
  for_each         = var.sources
  source           = "./modules/sumologic_sources"
  http_source_name = each.value["http_source_name"]
  category         = each.value["category"]
  collector_id     = each.value["collector_id"]
  timezone         = each.value["timezone"]
  filters          = each.value["filters"]

}
##
module "fluent-bit" {
  source               = "./modules/fluent-bit"
  data_sources         = var.sources
  fluent_bit_namespace = var.fluent_bit_namespace
  location             = var.location
  project_id           = var.project_id
  cluster_name         = var.cluster_name
  depends_on = [
    module.sumologic_sources
  ]
}