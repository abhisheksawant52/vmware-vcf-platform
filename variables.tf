variable "vsphere_server" {
  description = "vCenter Server FQDN or IP."
  type        = string
}

variable "vsphere_user" {
  description = "vCenter username."
  type        = string
}

variable "vsphere_password" {
  description = "vCenter password."
  type        = string
  sensitive   = true
}

variable "nsx_manager_host" {
  description = "NSX-T Manager FQDN or IP."
  type        = string
}

variable "nsx_username" {
  description = "NSX-T username."
  type        = string
}

variable "nsx_password" {
  description = "NSX-T password."
  type        = string
  sensitive   = true
}

variable "allow_unverified_ssl" {
  description = "Skip TLS verification (lab use only)."
  type        = bool
  default     = false
}

variable "environment" {
  description = "Environment name (dev, prod)."
  type        = string
  default     = "dev"
}

variable "datacenter" {
  description = "Name of the vSphere datacenter."
  type        = string
}

variable "workload_domain" {
  description = "Workload domain (compute cluster) configuration."
  type = object({
    cluster_name = string
    hosts        = list(string)
    drs_enabled  = bool
    ha_enabled   = bool
    vsan_enabled = bool
  })
}

variable "datastores" {
  description = "NFS datastores to mount, keyed by name."
  type = map(object({
    remote_host = string
    remote_path = string
  }))
  default = {}
}

variable "edge_cluster_path" {
  description = "NSX-T policy path of the Edge cluster for Tier-0/Tier-1."
  type        = string
}

variable "transport_zone_path" {
  description = "NSX-T overlay transport zone policy path."
  type        = string
}

variable "tier0_gateway_name" {
  description = "Name of the Tier-0 gateway."
  type        = string
  default     = "t0-vcf"
}

variable "segments" {
  description = "Overlay segments keyed by name."
  type = map(object({
    gateway_cidr = string
    vlan_ids     = optional(list(string))
  }))
  default = {}
}
