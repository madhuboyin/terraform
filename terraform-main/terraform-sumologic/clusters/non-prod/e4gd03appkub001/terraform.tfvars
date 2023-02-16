fluent_bit_namespace = "fluent-bit"
location             = "us-east4-a"
project_id           = "sharedinfra-host-test"
cluster_name         = "e4gd03appkub001"
# Collector Name: GCP-EAST4-DEV-NEW, Collector ID: 208612559
sources = {
  catalog = {
    http_source_name = "e4gd03appkub001_catalog",
    category         = "feo/dev03/gke/e4/catalog",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}

  },
  category = {
    http_source_name = "e4gd03appkub001_category",
    category         = "feo/dev03/gke/e4/category",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}

  },
  composite = {
    http_source_name = "e4gd03appkub001_composite",
    category         = "feo/dev03/gke/e4/composite",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}

  },
  xt = {
    http_source_name = "e4gd03appkub001_xt",
    category         = "feo/dev03/gke/e4/xt",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}

  },
  //
  beyondplusinfo = {
    http_source_name = "e4gd03appkub001_beyondplusinfo",
    category         = "feo/dev03/gke/e4/beyondplusinfo",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}

  },
  cacheassembler = {
    http_source_name = "e4gd03appkub001_cacheassembler",
    category         = "feo/dev03/gke/e4/cacheassembler",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  catalog-v2 = {
    http_source_name = "e4gd03appkub001_catalog-v2",
    category         = "feo/dev03/gke/e4/catalog-v2",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}

  },
  composite-product-listing = {
    http_source_name = "e4gd03appkub001_composite-product-listing",
    category         = "feo/dev03/gke/e4/composite-product-listing",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}

  },
  configserver-v3 = {
    http_source_name = "e4gd03appkub001_configserver-v3",
    category         = "feo/dev03/gke/e4/configserver-v3",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}

  },
  drupal = {
    http_source_name = "e4gd03appkub001_drupal",
    category         = "feo/dev03/gke/e4/drupal",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  ecom-nginx = {
    http_source_name = "e4gd03appkub001_ecom-nginx",
    category         = "feo/dev03/gke/e4/ecom-nginx",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  edd = {
    http_source_name = "e4gd03appkub001_edd",
    category         = "feo/dev03/gke/e4/edd",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}

  },
  ideaboard = {
    http_source_name = "e4gd03appkub001_ideaboard",
    category         = "feo/dev03/gke/e4/ideaboard",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  intg-monetization = {
    http_source_name = "e4gd03appkub001_intg-monetization",
    category         = "feo/dev03/gke/e4/intg-monetization",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}

  },
  pdfcontent = {
    http_source_name = "e4gd03appkub001_pdfcontent",
    category         = "feo/dev03/gke/e4/pdfcontent",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}

  },
  pickupinfo = {
    http_source_name = "e4gd03appkub001_pickupinfo",
    category         = "feo/dev03/gke/e4/pickupinfo",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}

  },
  pregen = {
    http_source_name = "e4gd03appkub001_pregen",
    category         = "feo/dev03/gke/e4/pregen",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  registry-category = {
    http_source_name = "e4gd03appkub001_registry-category",
    category         = "feo/dev03/gke/e4/registry-category",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  registry-search = {
    http_source_name = "e4gd03appkub001_registry-search",
    category         = "feo/dev03/gke/e4/registry-search",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  store-v1 = {
    http_source_name = "e4gd03appkub001_store-v1",
    category         = "feo/dev03/gke/e4/store-v1",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  xt-checkout = {
    http_source_name = "e4gd03appkub001_xt-checkout",
    category         = "feo/dev03/gke/e4/xt-checkout",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
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
}


