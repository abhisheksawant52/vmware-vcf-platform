output "cluster_id" {
  description = "Managed object ID of the compute cluster."
  value       = vsphere_compute_cluster.this.id
}

output "resource_pool_id" {
  description = "Root resource pool ID of the cluster."
  value       = vsphere_compute_cluster.this.resource_pool_id
}

output "host_ids" {
  description = "Managed object IDs of the ESXi hosts."
  value       = [for h in data.vsphere_host.hosts : h.id]
}

output "vm_folder_path" {
  description = "Inventory path of the workloads VM folder."
  value       = vsphere_folder.vms.path
}
