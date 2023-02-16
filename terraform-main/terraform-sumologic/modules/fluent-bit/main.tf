data "sumologic_http_source" "http_sources" {
  for_each    = var.data_sources
  collector_id = each.value["collector_id"]
  name = each.value["http_source_name"]

}

locals {

 apps_info = {for k, http_source_apps in data.sumologic_http_source.http_sources : k => substr(http_source_apps.url, -138, -1) }

}


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
