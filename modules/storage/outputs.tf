output "datastore_ids" {
  description = "Map of NFS datastore name to ID."
  value       = { for k, v in vsphere_nas_datastore.nfs : k => v.id }
}

output "datastore_cluster_id" {
  description = "Storage DRS datastore cluster ID (null when no NFS datastores)."
  value       = length(var.datastores) > 0 ? vsphere_datastore_cluster.sdrs[0].id : null
}
