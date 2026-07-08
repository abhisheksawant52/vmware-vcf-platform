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
