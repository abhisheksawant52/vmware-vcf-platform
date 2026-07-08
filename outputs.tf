output "cluster_id" {
  description = "Managed object ID of the workload domain cluster."
  value       = module.workload_domain.cluster_id
}

output "host_ids" {
  description = "Managed object IDs of the ESXi hosts."
  value       = module.workload_domain.host_ids
}

output "tier0_gateway_path" {
  description = "Policy path of the Tier-0 gateway."
  value       = module.nsx.tier0_gateway_path
}

output "segment_paths" {
  description = "Map of segment name to policy path."
  value       = module.nsx.segment_paths
}

output "datastore_ids" {
  description = "Map of NFS datastore name to ID."
  value       = module.storage.datastore_ids
}
