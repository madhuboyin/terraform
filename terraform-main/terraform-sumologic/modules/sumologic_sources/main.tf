resource "sumologic_http_source" "http_source" {
  name         = var.http_source_name
  category     = var.category
  collector_id = var.collector_id
  host_name    = var.http_source_name
  timezone     = var.timezone
  dynamic "filters" {
    for_each = var.filters
    content {
      name        = filters.value["name"]
      filter_type = filters.value["filter_type"]
      regexp      = filters.value["regexp"]

    }

  }

}
