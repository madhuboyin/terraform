fluent_bit_namespace = "fluent-bit"
location             = "us-east4-a"
project_id           = "sharedinfra-host-test"
cluster_name         = "e4gd01appkub001"
# Collector Name: GCP-EAST4-DEV-NEW, Collector ID: 208612559
sources = {
  catalog = {
    http_source_name = "e4gd01appkub001_catalog",
    category         = "feo/dev01/gke/e4/catalog",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  composite = {
    http_source_name = "e4gd01appkub001_composite",
    category         = "feo/dev01/gke/e4/composite",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },

  xt = {
    http_source_name = "e4gd01appkub001_xt",
    category         = "feo/dev01/gke/e4/xt",
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
  //
  beyondplusinfo = {
    http_source_name = "e4gd01appkub001_beyondplusinfo",
    category         = "feo/dev01/gke/e4/beyondplusinfo",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  cacheassembler = {
    http_source_name = "e4gd01appkub001_cacheassembler",
    category         = "feo/dev01/gke/e4/cacheassembler",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  catalog-v2 = {
    http_source_name = "e4gd01appkub001_catalog-v2",
    category         = "feo/dev01/gke/e4/catalog-v2",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  cbcc-redirect = {
    http_source_name = "e4gd01appkub001_cbcc-redirect",
    category         = "feo/dev01/gke/e4/cbcc-redirect",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },

  composite-product-listing = {
    http_source_name = "e4gd01appkub001_composite-product-listing",
    category         = "feo/dev01/gke/e4/composite-product-listing",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  content-search = {
    http_source_name = "e4gd01appkub001_content-search",
    category         = "feo/dev01/gke/e4/content-search",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  conversations = {
    http_source_name = "e4gd01appkub001_conversations",
    category         = "feo/dev01/gke/e4/conversations",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  curbside = {
    http_source_name = "e4gd01appkub001_curbside",
    category         = "feo/dev01/gke/e4/curbside",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  drupal = {
    http_source_name = "e4gd01appkub001_drupal",
    category         = "feo/dev01/gke/e4/drupal",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },

  edd = {
    http_source_name = "e4gd01appkub001_edd",
    category         = "feo/dev01/gke/e4/edd",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  expresspay = {
    http_source_name = "e4gd01appkub001_expresspay",
    category         = "feo/dev01/gke/e4/expresspay",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },

  ideaboard = {
    http_source_name = "e4gd01appkub001_ideaboard",
    category         = "feo/dev01/gke/e4/ideaboard",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },

  harmon-us = {
    http_source_name = "e4gd01appkub001_harmon-us",
    category         = "feo/dev01/gke/e4/harmon-us",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },

  intg-monetization = {
    http_source_name = "e4gd01appkub001_intg-monetization",
    category         = "feo/dev01/gke/e4/intg-monetization",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },

  marketplace = {
    http_source_name = "e4gd01appkub001_marketplace",
    category         = "feo/dev01/gke/e4/marketplace",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },

  mktplace-global = {
    http_source_name = "e4gd01appkub001_mktplace-global",
    category         = "feo/dev01/gke/e4/mktplace-global",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },

  notifications = {
    http_source_name = "e4gd01appkub001_notifications",
    category         = "feo/dev01/gke/e4/notifications",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },

  pdfcontent = {
    http_source_name = "e4gd01appkub001_pdfcontent",
    category         = "feo/dev01/gke/e4/pdfcontent",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },

  pickupinfo = {
    http_source_name = "e4gd01appkub001_pickupinfo",
    category         = "feo/dev01/gke/e4/pickupinfo",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },

  pregen = {
    http_source_name = "e4gd01appkub001_pregen",
    category         = "feo/dev01/gke/e4/pregen",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },

  recommendations = {
    http_source_name = "e4gd01appkub001_recommendations",
    category         = "feo/dev01/gke/e4/recommendations",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },

  sddoffer-info = {
    http_source_name = "e4gd01appkub001_sddoffer-info",
    category         = "feo/dev01/gke/e4/sddoffer-info",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },

  search-knowledge-center = {
    http_source_name = "e4gd01appkub001_search-knowledge-center",
    category         = "feo/dev01/gke/e4/search-knowledge-center",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },

  static-knowledge-center = {
    http_source_name = "e4gd01appkub001_static-knowledge-center",
    category         = "feo/dev01/gke/e4/static-knowledge-center",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },

  static-own-brands-bedbathcanada = {
    http_source_name = "e4gd01appkub001_static-own-brands-bedbathcanada",
    category         = "feo/dev01/gke/e4/static-own-brands-bedbathcanada",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },

  static-own-brands-bedbathus = {
    http_source_name = "e4gd01appkub001_static-own-brands-bedbathus",
    category         = "feo/dev01/gke/e4/static-own-brands-bedbathus",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },

  static-own-brands-buybuybaby = {
    http_source_name = "e4gd01appkub001_static-own-brands-buybuybaby",
    category         = "feo/dev01/gke/e4/static-own-brands-buybuybaby",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },

  registry-category = {
    http_source_name = "e4gd01appkub001_registry-category",
    category         = "feo/dev01/gke/e4/registry-category",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  registry-search = {
    http_source_name = "e4gd01appkub001_registry-search",
    category         = "feo/dev01/gke/e4/registry-search",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  store-v1 = {
    http_source_name = "e4gd01appkub001_store-v1",
    category         = "feo/dev01/gke/e4/store-v1",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  sayt-search = {
    http_source_name = "e4gd01appkub001_sayt-search",
    category         = "feo/dev01/gke/e4/sayt-search",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  xt-checkout = {
    http_source_name = "e4gd01appkub001_xt-checkout",
    category         = "feo/dev01/gke/e4/xt-checkout",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  //
  blc-authentication = {
    http_source_name = "e4gd01appkub001_blc-authentication",
    category         = "feo/dev01/gke/e4/blc-authentication",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  blc-flex-process = {
    http_source_name = "e4gd01appkub001_blc-flex-process",
    category         = "feo/dev01/gke/e4/blc-flex-process",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  blc-flex-support = {
    http_source_name = "e4gd01appkub001_blc-flex-support",
    category         = "feo/dev01/gke/e4/blc-flex-support",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  blc-offer = {
    http_source_name = "e4gd01appkub001_blc-offer",
    category         = "feo/dev01/gke/e4/blc-offer",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  blc-xt-admin = {
    http_source_name = "e4gd01appkub001_blc-xt-admin",
    category         = "feo/dev01/gke/e4/blc-xt-admin",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  blc-flex-support = {
    http_source_name = "e4gd01appkub001_blc-flex-support",
    category         = "feo/dev01/gke/e4/blc-flex-support",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  blc-admin-gateway = {
    http_source_name = "e4gd01appkub001_blc-admin-gateway",
    category         = "feo/dev01/gke/e4/blc-admin-gateway",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  push-notification = {
    http_source_name = "e4gd01appkub001_push-notification",
    category         = "feo/dev01/gke/e4/push-notification",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  college = {
    http_source_name = "e4gd01appkub001_college",
    category         = "feo/dev01/gke/e4/college",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  address-service = {
    http_source_name = "e4gd01appkub001_address-service",
    category         = "feo/dev01/gke/e4/address-service",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  email-pref-service = {
    http_source_name = "e4gd01appkub001_email-pref-service",
    category         = "feo/dev01/gke/e4/email-pref-service",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  ev-scheduler-service = {
    http_source_name = "e4gd01appkub001_ev-scheduler-service",
    category         = "feo/dev01/gke/e4/ev-scheduler-service",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  profile-info = {
    http_source_name = "e4gd01appkub001_profile-info",
    category         = "feo/dev01/gke/e4/profile-info",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  user-benefit-svc = {
    http_source_name = "e4gd01appkub001_user-benefit-svc",
    category         = "feo/dev01/gke/e4/user-benefit-svc",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  email-service = {
    http_source_name = "e4gd01appkub001_email-service",
    category         = "feo/dev01/gke/e4/email-service",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {} 
  },
  configserver-v3 = {
    http_source_name = "e4gd01appkub001_configserver-v3",
    category         = "feo/dev01/gke/e4/configserver-v3",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  },
  social-service = {
    http_source_name = "e4gd01appkub001_social-service",
    category         = "feo/dev01/gke/e4/social-service",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {} 
  },
  content-stack = {
    http_source_name = "e4gd01appkub001_content-stack",
    category         = "feo/dev01/gke/e4/content-stack",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {} 
  },
  ecom-nginx-proxy = {
    http_source_name = "e4gd01appkub001_ecom-nginx-proxy",
    category         = "feo/dev01/gke/e4/ecom-nginx-proxy",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {} 
  },
  user-benefit-service = {
    http_source_name = "e4gd01appkub001_user-benefit-service",
    category         = "feo/dev01/gke/e4/user-benefit-service",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {} 
  },
  registry-owner = {
    http_source_name = "e4gd01appkub001_registry-owner",
    category         = "feo/dev01/gke/e4/registry-owner",
    collector_id     = "208612559",
    timezone         = "",
    filters          = {}
  }
}
