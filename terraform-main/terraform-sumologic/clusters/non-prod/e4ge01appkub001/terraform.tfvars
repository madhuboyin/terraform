fluent_bit_namespace = "fluent-bit"
location             = "us-east4-a"
project_id           = "sharedinfra-host-test"
cluster_name         = "e4ge01appkub001"
# Collector Name: GCP-EAST4-DEV-NEW, Collector ID: 208612559
sources = {
  beyondplusinfo = {
    http_source_name = "e4ge01appkub001_beyondplusinfo",
    category         = "feo/eqa/gke/e4/beyondplusinfo",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}

  },
  cbcc-redirect = {
    http_source_name = "e4ge01appkub001_cbcc-redirect",
    category         = "feo/eqa/gke/e4/cbcc-redirect",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  content-search = {
    http_source_name = "e4ge01appkub001_content-search",
    category         = "feo/eqa/gke/e4/content-search",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  curbside = {
    http_source_name = "e4ge01appkub001_curbside",
    category         = "feo/eqa/gke/e4/curbside",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  drupal = {
    http_source_name = "e4ge01appkub001_drupal",
    category         = "feo/eqa/gke/e4/drupal",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  edd = {
    http_source_name = "e4ge01appkub001_edd",
    category         = "feo/eqa/gke/e4/edd",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  expresspay = {
    http_source_name = "e4ge01appkub001_expresspay",
    category         = "feo/eqa/gke/e4/expresspay",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  ideaboard = {
    http_source_name = "e4ge01appkub001_ideaboard",
    category         = "feo/eqa/gke/e4/ideaboard",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  intg-monetization = {
    http_source_name = "e4ge01appkub001_intg-monetization",
    category         = "feo/eqa/gke/e4/intg-monetization",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  marketplace = {
    http_source_name = "e4ge01appkub001_marketplace",
    category         = "feo/eqa/gke/e4/marketplace",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  pickupinfo = {
    http_source_name = "e4ge01appkub001_pickupinfo",
    category         = "feo/eqa/gke/e4/pickupinfo",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  pregen = {
    http_source_name = "e4ge01appkub001_pregen",
    category         = "feo/eqa/gke/e4/pregen",
    collector_id     = "208612559",
    timezone         = "",
    filters = {
      Rule_1 = {
        name        = "exclude_all",
        filter_type = "Exclude",
        regexp      = ".*.*",
      },
    }
  },
  recommendations = {
    http_source_name = "e4ge01appkub001_recommendations",
    category         = "feo/eqa/gke/e4/recommendations",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}

  },
  registry-search = {
    http_source_name = "e4ge01appkub001_registry-search",
    category         = "feo/eqa/gke/e4/registry-search",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  cacheassembler = {
    http_source_name = "e4ge01appkub001_cacheassembler",
    category         = "feo/eqa/gke/e4/cacheassembler",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  blc-offer = {
    http_source_name = "e4ge01appkub001_blc-offer",
    category         = "feo/eqa/gke/e4/blc-offer",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  blc-flex-support = {
    http_source_name = "e4ge01appkub001_blc-flex-support",
    category         = "feo/eqa/gke/e4/blc-flex-support",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  blc-flex-process = {
    http_source_name = "e4ge01appkub001_blc-flex-process",
    category         = "feo/eqa/gke/e4/blc-flex-process",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  blc-authentication = {
    http_source_name = "e4ge01appkub001_blc-authentication",
    category         = "feo/eqa/gke/e4/blc-authentication",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  blc-admin-gateway = {
    http_source_name = "e4ge01appkub001_blc-admin-gateway",
    category         = "feo/eqa/gke/e4/blc-admin-gateway",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
}
