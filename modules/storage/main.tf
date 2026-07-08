data "vsphere_datacenter" "dc" {
  name = var.datacenter
}

# NFS datastores mounted on all hosts in the cluster.
resource "vsphere_nas_datastore" "nfs" {
  for_each = var.datastores

  name            = each.key
  host_system_ids = var.host_ids
  type            = "NFS"
  remote_hosts    = [each.value.remote_host]
  remote_path     = each.value.remote_path
}

# Storage DRS datastore cluster grouping the NFS datastores.
resource "vsphere_datastore_cluster" "sdrs" {
  count = length(var.datastores) > 0 ? 1 : 0

  name                             = "dsc-workloads"
  datacenter_id                    = data.vsphere_datacenter.dc.id
  sdrs_enabled                     = true
  sdrs_automation_level            = "automated"
  sdrs_space_utilization_threshold = 80
  sdrs_io_load_balance_enabled     = true
}
