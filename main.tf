module "workload_domain" {
  source = "./modules/workload-domain"

  datacenter      = var.datacenter
  workload_domain = var.workload_domain
}

module "storage" {
  source = "./modules/storage"

  datacenter   = var.datacenter
  host_ids     = module.workload_domain.host_ids
  datastores   = var.datastores
  cluster_id   = module.workload_domain.cluster_id
  vsan_enabled = var.workload_domain.vsan_enabled
}

module "nsx" {
  source = "./modules/nsx"

  edge_cluster_path   = var.edge_cluster_path
  transport_zone_path = var.transport_zone_path
  tier0_gateway_name  = var.tier0_gateway_name
  segments            = var.segments
}
