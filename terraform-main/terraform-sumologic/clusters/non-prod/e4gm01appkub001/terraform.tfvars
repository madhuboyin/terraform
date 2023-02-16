fluent_bit_namespace = "fluent-bit"
location             = "us-east4-a"
project_id           = "sharedinfra-host-test"
cluster_name         = "e4gm01appkub001"
# Collector Name: GCP-EAST4-MIRROR-NEW, Collector ID: 209717474
sources = {
  catalog = {
    http_source_name = "e4gm01appkub001_catalog",
    category         = "feo/m01/gke/e4/catalog",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  composite = {
    http_source_name = "e4gm01appkub001_composite",
    category         = "feo/m01/gke/e4/composite",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  xt = {
    http_source_name = "e4gm01appkub001_xt",
    category         = "feo/m01/gke/e4/xt",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  //
  beyondplusinfo = {
    http_source_name = "e4gm01appkub001_beyondplusinfo",
    category         = "feo/m01/gke/e4/beyondplusinfo",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  cacheassembler = {
    http_source_name = "e4gm01appkub001_cacheassembler",
    category         = "feo/m01/gke/e4/cacheassembler",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  catalog-v2 = {
    http_source_name = "e4gm01appkub001_catalog-v2",
    category         = "feo/m01/gke/e4/catalog-v2",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  cbcc-redirect = {
    http_source_name = "e4gm01appkub001_cbcc-redirect",
    category         = "feo/m01/gke/e4/cbcc-redirect",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  curbside = {
    http_source_name = "e4gm01appkub001_curbside",
    category         = "feo/m01/gke/e4/curbside",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  drupal = {
    http_source_name = "e4gm01appkub001_drupal",
    category         = "feo/m01/gke/e4/drupal",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  ecom-nginx = {
    http_source_name = "e4gm01appkub001_ecom-nginx",
    category         = "feo/m01/gke/e4/ecom-nginx",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  ideaboard = {
    http_source_name = "e4gm01appkub001_ideaboard",
    category         = "feo/m01/gke/e4/ideaboard",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  intg-monetization = {
    http_source_name = "e4gm01appkub001_intg-monetization",
    category         = "feo/m01/gke/e4/intg-monetization",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  marketplace = {
    http_source_name = "e4gm01appkub001_marketplace",
    category         = "feo/m01/gke/e4/marketplace",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  pdfcontent = {
    http_source_name = "e4gm01appkub001_pdfcontent",
    category         = "feo/m01/gke/e4/pdfcontent",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  pickupinfo = {
    http_source_name = "e4gm01appkub001_pickupinfo",
    category         = "feo/m01/gke/e4/pickupinfo",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  pregen = {
    http_source_name = "e4gm01appkub001_pregen",
    category         = "feo/m01/gke/e4/pregen",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  recommendations = {
    http_source_name = "e4gm01appkub001_recommendations",
    category         = "feo/m01/gke/e4/recommendations",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  static-knowledge-center = {
    http_source_name = "e4gm01appkub001_static-knowledge-center",
    category         = "feo/m01/gke/e4/static-knowledge-center",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  static-own-brands-bedbathcanada = {
    http_source_name = "e4gm01appkub001_static-own-brands-bedbathcanada",
    category         = "feo/m01/gke/e4/static-own-brands-bedbathcanada",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  static-own-brands-bedbathus = {
    http_source_name = "e4gm01appkub001_static-own-brands-bedbathus",
    category         = "feo/m01/gke/e4/static-own-brands-bedbathus",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  static-own-brands-buybuybaby = {
    http_source_name = "e4gm01appkub001_static-own-brands-buybuybaby",
    category         = "feo/m01/gke/e4/static-own-brands-buybuybaby",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  registry-search = {
    http_source_name = "e4gm01appkub001_registry-search",
    category         = "feo/m01/gke/e4/registry-search",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  store-v1 = {
    http_source_name = "e4gm01appkub001_store-v1",
    category         = "feo/m01/gke/e4/store-v1",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
  xt-checkout = {
    http_source_name = "e4gm01appkub001_xt-checkout",
    category         = "feo/m01/gke/e4/xt-checkout",
    collector_id     = "209717474",
    timezone         = "",
    filters          = {}
  },
}