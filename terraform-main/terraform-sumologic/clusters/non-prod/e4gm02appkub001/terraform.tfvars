fluent_bit_namespace = "fluent-bit"
location             = "us-east4-a"
project_id           = "sharedinfra-host-test"
cluster_name         = "e4gm02appkub001"
# Collector Name: GCP-EAST4-MIRROR-NEW, Collector ID: 209717474
sources = {
  catalog = {
    http_source_name = "e4gm02appkub001_catalog",
    category         = "feo/m02/gke/e4/catalog",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  catalog-v2 = {
    http_source_name = "e4gm02appkub001_catalog-v2",
    category         = "feo/m02/gke/e4/catalog-v2",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  composite = {
    http_source_name = "e4gm02appkub001_composite",
    category         = "feo/m02/gke/e4/composite",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  xt = {
    http_source_name = "e4gm02appkub001_xt",
    category         = "feo/m02/gke/e4/xt",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  //
  beyondplusinfo = {
    http_source_name = "e4gm02appkub001_beyondplusinfo",
    category         = "feo/m02/gke/e4/beyondplusinfo",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  cacheassembler = {
    http_source_name = "e4gm02appkub001_cacheassembler",
    category         = "feo/m02/gke/e4/cacheassembler",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  category = {
    http_source_name = "e4gm02appkub001_category",
    category         = "feo/m02/gke/e4/category",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  cbcc-redirect = {
    http_source_name = "e4gm02appkub001_cbcc-redirect",
    category         = "feo/m02/gke/e4/cbcc-redirect",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  curbside = {
    http_source_name = "e4gm02appkub001_curbside",
    category         = "feo/m02/gke/e4/curbside",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  drupal = {
    http_source_name = "e4gm02appkub001_drupal",
    category         = "feo/m02/gke/e4/drupal",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  edd = {
    http_source_name = "e4gm02appkub001_edd",
    category         = "feo/m02/gke/e4/edd",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  ideaboard = {
    http_source_name = "e4gm02appkub001_ideaboard",
    category         = "feo/m02/gke/e4/ideaboard",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  intg-monetization = {
    http_source_name = "e4gm02appkub001_intg-monetization",
    category         = "feo/m02/gke/e4/intg-monetization",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  marketplace = {
    http_source_name = "e4gm02appkub001_marketplace",
    category         = "feo/m02/gke/e4/marketplace",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  pdfcontent = {
    http_source_name = "e4gm02appkub001_pdfcontent",
    category         = "feo/m02/gke/e4/pdfcontent",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  pickupinfo = {
    http_source_name = "e4gm02appkub001_pickupinfo",
    category         = "feo/m02/gke/e4/pickupinfo",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  pregen = {
    http_source_name = "e4gm02appkub001_pregen",
    category         = "feo/m02/gke/e4/pregen",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  recommendations = {
    http_source_name = "e4gm02appkub001_recommendations",
    category         = "feo/m02/gke/e4/recommendations",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  static-knowledge-center = {
    http_source_name = "e4gm02appkub001_static-knowledge-center",
    category         = "feo/m02/gke/e4/static-knowledge-center",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  static-own-brands-bedbathcanada = {
    http_source_name = "e4gm02appkub001_static-own-brands-bedbathcanada",
    category         = "feo/m02/gke/e4/static-own-brands-bedbathcanada",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  static-own-brands-bedbathus = {
    http_source_name = "e4gm02appkub001_static-own-brands-bedbathus",
    category         = "feo/m02/gke/e4/static-own-brands-bedbathus",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  static-own-brands-buybuybaby = {
    http_source_name = "e4gm02appkub001_static-own-brands-buybuybaby",
    category         = "feo/m02/gke/e4/static-own-brands-buybuybaby",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  registry-search = {
    http_source_name = "e4gm02appkub001_registry-search",
    category         = "feo/m02/gke/e4/registry-search",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  store-v1 = {
    http_source_name = "e4gm02appkub001_store-v1",
    category         = "feo/m02/gke/e4/store-v1",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  xt-checkout = {
    http_source_name = "e4gm02appkub001_xt-checkout",
    category         = "feo/m02/gke/e4/xt-checkout",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  xt-micro-shell = {
    http_source_name = "e4gm02appkub001_xt-micro-shell",
    category         = "feo/m02/gke/e4/xt-micro-shell",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  composite-product-listing = {
    http_source_name = "e4gm02appkub001_composite-product-listing",
    category         = "feo/m02/gke/e4/composite-product-listing",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  configserver-v3 = {
    http_source_name = "e4gm02appkub001_configserver-v3",
    category         = "feo/m02/gke/e4/configserver-v3",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  conversations = {
    http_source_name = "e4gm02appkub001_conversations",
    category         = "feo/m02/gke/e4/conversations",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  catalog-stream = {
    http_source_name = "e4gm02appkub001_catalog-stream",
    category         = "feo/m02/gke/e4/catalog-stream",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  catalog-api = {
    http_source_name = "e4gm02appkub001_catalog-api",
    category         = "feo/m02/gke/e4/catalog-api",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  catalog-price-batch = {
    http_source_name = "e4gm02appkub001_catalog-price-batch",
    category         = "feo/m02/gke/e4/catalog-price-batch",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  catalog-audit = {
    http_source_name = "e4gm02appkub001_catalog-audit",
    category         = "feo/m02/gke/e4/catalog-audit",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  lookup-stream = {
    http_source_name = "e4gm02appkub001_lookup-stream",
    category         = "feo/m02/gke/e4/lookup-stream",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  lookup-staging = {
    http_source_name = "e4gm02appkub001_lookup-staging",
    category         = "feo/m02/gke/e4/lookup-staging",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  lookup-batch = {
    http_source_name = "e4gm02appkub001_lookup-batch",
    category         = "feo/m02/gke/e4/lookup-batch",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  price-stream = {
    http_source_name = "e4gm02appkub001_price-stream",
    category         = "feo/m02/gke/e4/price-stream",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  store-stream = {
    http_source_name = "e4gm02appkub001_store-stream",
    category         = "feo/m02/gke/e4/store-stream",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  inventory-stream = {
    http_source_name = "e4gm02appkub001_inventory-stream",
    category         = "feo/m02/gke/e4/inventory-stream",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  catalog-atg-interface = {
    http_source_name = "e4gm02appkub001_catalog-atg-interface",
    category         = "feo/m02/gke/e4/catalog-atg-interface",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  catalog-redis = {
    http_source_name = "e4gm02appkub001_catalog-redis",
    category         = "feo/m02/gke/e4/catalog-redis",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  mktplace-global = {
    http_source_name = "e4gm02appkub001_mktplace-global",
    category         = "feo/m02/gke/e4/mktplace-global",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  blc-offer = {
    http_source_name = "e4gm02appkub001_blc-offer",
    category         = "feo/m02/gke/e4/blc-offer",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  blc-flex-support = {
    http_source_name = "e4gm02appkub001_blc-flex-support",
    category         = "feo/m02/gke/e4/blc-flex-support",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  blc-flex-process = {
    http_source_name = "e4gm02appkub001_blc-flex-process",
    category         = "feo/m02/gke/e4/blc-flex-process",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  blc-authentication = {
    http_source_name = "e4gm02appkub001_blc-authentication",
    category         = "feo/m02/gke/e4/blc-authentication",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  blc-admin-gateway = {
    http_source_name = "e4gm02appkub001_blc-admin-gateway",
    category         = "feo/m02/gke/e4/blc-admin-gateway",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  push-notification = {
    http_source_name = "e4gm02appkub001_push-notification",
    category         = "feo/m02/gke/e4/push-notification",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  sayt-search = {
    http_source_name = "e4gm02appkub001_sayt-search",
    category         = "feo/m02/gke/e4/sayt-search",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  content-search = {
    http_source_name = "e4gm02appkub001_content-search",
    category         = "feo/m02/gke/e4/content-search",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  content-stack = {
    http_source_name = "e4gm02appkub001_content-stack",
    category         = "feo/m02/gke/e4/content-stack",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  search-knowledge-center = {
    http_source_name = "e4gm02appkub001_search-knowledge-center",
    category         = "feo/m02/gke/e4/search-knowledge-center",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  ecom-nginx-proxy = {
    http_source_name = "e4gm02appkub001_ecom-nginx-proxy",
    category         = "feo/m02/gke/e4/ecom-nginx-proxy",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  }
  ecom-nginx = {
    http_source_name = "e4gm02appkub001_ecom-nginx",
    category         = "feo/m02/gke/e4/ecom-nginx",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  }
}
