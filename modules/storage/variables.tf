variable "datacenter" {
  description = "Name of the vSphere datacenter."
  type        = string
}

variable "host_ids" {
  description = "ESXi host managed object IDs to mount datastores on."
  type        = list(string)
}

variable "cluster_id" {
  description = "Compute cluster ID (used for vSAN association context)."
  type        = string
}

variable "vsan_enabled" {
  description = "Whether vSAN is enabled on the cluster."
  type        = bool
  default     = false
}

variable "datastores" {
  description = "NFS datastores to mount, keyed by name."
  type = map(object({
    remote_host = string
    remote_path = string
  }))
  default = {}
}
