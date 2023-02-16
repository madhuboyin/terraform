fluent_bit_namespace = "fluent-bit"
location             = "us-east4-a"
project_id           = "sharedinfra-host-test"
cluster_name         = "e4gt01appkub001"
# Collector Name: GCP-EAST4-DEV-NEW, Collector ID: 208612559
sources = {
  catalog = {
    http_source_name = "e4gt01appkub001_catalog",
    category         = "feo/test01/gke/e4/catalog",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  composite = {
    http_source_name = "e4gt01appkub001_composite",
    category         = "feo/test01/gke/e4/composite",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },

  xt = {
    http_source_name = "e4gt01appkub001_xt",
    category         = "feo/test01/gke/e4/xt",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  beyondplusinfo = {
    http_source_name = "e4gt01appkub001_beyondplusinfo",
    category         = "feo/test01/gke/e4/beyondplusinfo",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  cacheassembler = {
    http_source_name = "e4gt01appkub001_cacheassembler",
    category         = "feo/test01/gke/e4/cacheassembler",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  catalog-v2 = {
    http_source_name = "e4gt01appkub001_catalog-v2",
    category         = "feo/test01/gke/e4/catalog-v2",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  cbcc-redirect = {
    http_source_name = "e4gt01appkub001_cbcc-redirect",
    category         = "feo/test01/gke/e4/cbcc-redirect",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  composite-product-listing = {
    http_source_name = "e4gt01appkub001_composite-product-listing",
    category         = "feo/test01/gke/e4/composite-product-listing",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  content-search = {
    http_source_name = "e4gt01appkub001_content-search",
    category         = "feo/test01/gke/e4/content-search",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  conversations = {
    http_source_name = "e4gt01appkub001_conversations",
    category         = "feo/test01/gke/e4/conversations",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  expresspay = {
    http_source_name = "e4gt01appkub001_expresspay",
    category         = "feo/test01/gke/e4/expresspay",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },

  ideaboard = {
    http_source_name = "e4gt01appkub001_ideaboard",
    category         = "feo/test01/gke/e4/ideaboard",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },

  harmon-us = {
    http_source_name = "e4gt01appkub001_harmon-us",
    category         = "feo/test01/gke/e4/harmon-us",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },

  intg-monetization = {
    http_source_name = "e4gt01appkub001_intg-monetization",
    category         = "feo/test01/gke/e4/intg-monetization",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },

  marketplace = {
    http_source_name = "e4gt01appkub001_marketplace",
    category         = "feo/test01/gke/e4/marketplace",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  sayt-search = {
    http_source_name = "e4gt01appkub001_sayt-search",
    category         = "feo/test01/gke/e4/sayt-search",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  notifications = {
    http_source_name = "e4gt01appkub001_notifications",
    category         = "feo/test01/gke/e4/notifications",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },

  pickupinfo = {
    http_source_name = "e4gt01appkub001_pickupinfo",
    category         = "feo/test01/gke/e4/pickupinfo",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },

  pregen = {
    http_source_name = "e4gt01appkub001_pregen",
    category         = "feo/test01/gke/e4/pregen",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },   

  recommendations = {
    http_source_name = "e4gt01appkub001_recommendations",
    category         = "feo/test01/gke/e4/recommendations",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },

  sddoffer-info = {
    http_source_name = "e4gt01appkub001_sddoffer-info",
    category         = "feo/test01/gke/e4/sddoffer-info",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },

  registry-category = {
    http_source_name = "e4gt01appkub001_registry-category",
    category         = "feo/test01/gke/e4/registry-category",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  registry-search = {
    http_source_name = "e4gt01appkub001_registry-search",
    category         = "feo/test01/gke/e4/registry-search",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  store-v1 = {
    http_source_name = "e4gt01appkub001_store-v1",
    category         = "feo/test01/gke/e4/store-v1",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  xt-checkout = {
    http_source_name = "e4gt01appkub001_xt-checkout",
    category         = "feo/test01/gke/e4/xt-checkout",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  blc-authentication = {
    http_source_name = "e4gt01appkub001_blc-authentication",
    category         = "feo/test01/gke/e4/blc-authentication",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  blc-flex-process = {
    http_source_name = "e4gt01appkub001_blc-flex-process",
    category         = "feo/test01/gke/e4/blc-flex-process",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  blc-flex-support = {
    http_source_name = "e4gt01appkub001_blc-flex-support",
    category         = "feo/test01/gke/e4/blc-flex-support",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  blc-offer = {
    http_source_name = "e4gt01appkub001_blc-offer",
    category         = "feo/test01/gke/e4/blc-offer",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  blc-xt-admin = {
    http_source_name = "e4gt01appkub001_blc-xt-admin",
    category         = "feo/test01/gke/e4/blc-xt-admin",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  blc-admin-gateway = {
    http_source_name = "e4gt01appkub001_blc-admin-gateway",
    category         = "feo/test01/gke/e4/blc-admin-gateway",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  push-notification = {
    http_source_name = "e4gt01appkub001_push-notification",
    category         = "feo/test01/gke/e4/push-notification",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  college = {
    http_source_name = "e4gt01appkub001_college",
    category         = "feo/test01/gke/e4/college",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  content-stack = {
    http_source_name = "e4gt01appkub001_content-stack",
    category         = "feo/test01/gke/e4/content-stack",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  configserver-v3 = {
    http_source_name = "e4gt01appkub001_configserver-v3",
    category         = "feo/test01/gke/e4/configserver-v3",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  nginx-proxy = {
    http_source_name = "e4gt01appkub001_nginx-proxy",
    category         = "feo/test01/gke/e4/nginx-proxy",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  }
}
