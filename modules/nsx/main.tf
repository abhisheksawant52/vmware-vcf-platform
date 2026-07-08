resource "nsxt_policy_tier0_gateway" "t0" {
  display_name      = var.tier0_gateway_name
  description       = "Tier-0 gateway for the VCF workload domain"
  failover_mode     = "PREEMPTIVE"
  ha_mode           = "ACTIVE_STANDBY"
  edge_cluster_path = var.edge_cluster_path
  transit_subnets   = ["100.64.0.0/16"]
}

resource "nsxt_policy_tier1_gateway" "t1" {
  display_name      = "t1-workloads"
  description       = "Tier-1 gateway for workload segments"
  tier0_path        = nsxt_policy_tier0_gateway.t0.path
  edge_cluster_path = var.edge_cluster_path
  failover_mode     = "PREEMPTIVE"
  route_advertisement_types = [
    "TIER1_CONNECTED",
    "TIER1_STATIC_ROUTES",
  ]
}

resource "nsxt_policy_segment" "this" {
  for_each = var.segments

  display_name        = each.key
  description         = "Overlay segment ${each.key}"
  connectivity_path   = nsxt_policy_tier1_gateway.t1.path
  transport_zone_path = var.transport_zone_path

  subnet {
    cidr = each.value.gateway_cidr
  }
}
