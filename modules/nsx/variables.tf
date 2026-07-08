variable "edge_cluster_path" {
  description = "NSX-T policy path of the Edge cluster."
  type        = string
}

variable "transport_zone_path" {
  description = "NSX-T overlay transport zone policy path."
  type        = string
}

variable "tier0_gateway_name" {
  description = "Name of the Tier-0 gateway."
  type        = string
}

variable "segments" {
  description = "Overlay segments keyed by name."
  type = map(object({
    gateway_cidr = string
    vlan_ids     = optional(list(string))
  }))
  default = {}
}
