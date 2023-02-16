fluent_bit_namespace = "fluent-bit"
location             = "us-east4-a"
project_id           = "prod-host-project"
cluster_name         = "e4gp01appkub001"
# Collector Name: GCP-EAST4-PROD-NEW, Collector ID: 210396316
sources = {
  catalog-stream = {
    http_source_name = "e4gp01appkub001_catalog-stream",
    category         = "feo/prod/gke/e4/catalog-stream",
    collector_id     = "210396316",
    timezone         = "America/New_York",
    filters = {
      Rule_1 = {
        name        = "exclude_all",
        filter_type = "Exclude",
        regexp      = ".*.*",
      },
    }
  },
  catalog-api = {
    http_source_name = "e4gp01appkub001_catalog-api",
    category         = "feo/prod/gke/e4/catalog-api",
    collector_id     = "210396316",
    timezone         = "America/New_York",
    filters          = {}
  },
  catalog-price-batch = {
    http_source_name = "e4gp01appkub001_catalog-price-batch",
    category         = "feo/prod/gke/e4/catalog-price-batch",
    collector_id     = "210396316",
    timezone         = "America/New_York",
    filters = {
      Rule_1 = {
        name        = "exclude_debug",
        filter_type = "Exclude",
        regexp      = "(?s).*DEBUG.*(?s)",
      },
    }
  },
  catalog-audit = {
    http_source_name = "e4gp01appkub001_catalog-audit",
    category         = "feo/prod/gke/e4/catalog-audit",
    collector_id     = "210396316",
    timezone         = "America/New_York",
    filters = {
      Rule_1 = {
        name        = "exclude_all",
        filter_type = "Exclude",
        regexp      = ".*.*",
      },
    }
  },
  pregen = {
    http_source_name = "e4gp01appkub001_pregen",
    category         = "feo/prod/gke/e4/pregen",
    collector_id     = "210396316",
    timezone         = "",
    filters = {
      Rule_1 = {
        name        = "exclude_all",
        filter_type = "Exclude",
        regexp      = ".*.*",
      },
    }
  },
  lookup-stream = {
    http_source_name = "e4gp01appkub001_lookup-stream",
    category         = "feo/prod/gke/e4/lookup-stream",
    collector_id     = "210396316",
    timezone         = "America/New_York",
    filters          = {}
  },
  lookup-staging = {
    http_source_name = "e4gp01appkub001_lookup-staging",
    category         = "feo/prod/gke/e4/lookup-staging",
    collector_id     = "210396316",
    timezone         = "America/New_York",
    filters          = {}
  },
  lookup-batch = {
    http_source_name = "e4gp01appkub001_lookup-batch",
    category         = "feo/prod/gke/e4/lookup-batch",
    collector_id     = "210396316",
    timezone         = "America/New_York",
    filters          = {}
  },
  price-stream = {
    http_source_name = "e4gp01appkub001_price-stream",
    category         = "feo/prod/gke/e4/price-stream",
    collector_id     = "210396316",
    timezone         = "America/New_York",
    filters          = {}
  },
  store-stream = {
    http_source_name = "e4gp01appkub001_store-stream",
    category         = "feo/prod/gke/e4/store-stream",
    collector_id     = "210396316",
    timezone         = "America/New_York",
    filters          = {}
  },
  inventory-stream = {
    http_source_name = "e4gp01appkub001_inventory-stream",
    category         = "feo/prod/gke/e4/inventory-stream",
    collector_id     = "210396316",
    timezone         = "America/New_York",
    filters          = {}
  },
  catalog-atg-interface = {
    http_source_name = "e4gp01appkub001_catalog-atg-interface",
    category         = "feo/prod/gke/e4/catalog-atg-interface",
    collector_id     = "210396316",
    timezone         = "America/New_York",
    filters          = {}
  },
  catalog-redis = {
    http_source_name = "e4gp01appkub001_catalog-redis",
    category         = "feo/prod/gke/e4/catalog-redis",
    collector_id     = "210396316",
    timezone         = "America/New_York",
    filters          = {}
  },
  blc-offer = {
    http_source_name = "e4gp01appkub001_blc-offer",
    category         = "feo/prod/gke/e4/blc-offer",
    collector_id     = "210396316",
    timezone         = "",
    filters          = {}
  },
  blc-flex-support = {
    http_source_name = "e4gp01appkub001_blc-flex-support",
    category         = "feo/prod/gke/e4/blc-flex-support",
    collector_id     = "210396316",
    timezone         = "",
    filters          = {}
  },
  blc-flex-process = {
    http_source_name = "e4gp01appkub001_blc-flex-process",
    category         = "feo/prod/gke/e4/blc-flex-process",
    collector_id     = "210396316",
    timezone         = "",
    filters          = {}
  },
  blc-authentication = {
    http_source_name = "e4gp01appkub001_blc-authentication",
    category         = "feo/prod/gke/e4/blc-authentication",
    collector_id     = "210396316",
    timezone         = "",
    filters          = {}
  },
  blc-admin-gateway = {
    http_source_name = "e4gp01appkub001_blc-admin-gateway",
    category         = "feo/prod/gke/e4/blc-admin-gateway",
    collector_id     = "210396316",
    timezone         = "",
    filters          = {}
  },
  push-notification = {
    http_source_name = "e4gp01appkub001_push-notification",
    category         = "feo/prod/gke/e4/push-notification",
    collector_id     = "210396316",
    timezone         = "",
    filters          = {}
  }
}


