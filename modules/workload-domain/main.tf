data "vsphere_datacenter" "dc" {
  name = var.datacenter
}

data "vsphere_host" "hosts" {
  for_each = toset(var.workload_domain.hosts)

  name          = each.value
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_compute_cluster" "this" {
  name          = var.workload_domain.cluster_name
  datacenter_id = data.vsphere_datacenter.dc.id
  host_system_ids = [
    for h in data.vsphere_host.hosts : h.id
  ]

  drs_enabled          = var.workload_domain.drs_enabled
  drs_automation_level = "fullyAutomated"

  ha_enabled                                    = var.workload_domain.ha_enabled
  ha_admission_control_host_failure_tolerance   = 1
  ha_admission_control_performance_tolerance    = 100
  ha_host_monitoring                            = "enabled"
  ha_vm_restart_priority                        = "medium"

  vsan_enabled                 = var.workload_domain.vsan_enabled
  vsan_dedup_enabled           = var.workload_domain.vsan_enabled
  vsan_compression_enabled     = var.workload_domain.vsan_enabled
  vsan_performance_enabled     = var.workload_domain.vsan_enabled
}

resource "vsphere_resource_pool" "workloads" {
  name                    = "rp-workloads"
  parent_resource_pool_id = vsphere_compute_cluster.this.resource_pool_id
}

resource "vsphere_folder" "vms" {
  path          = "workloads"
  type          = "vm"
  datacenter_id = data.vsphere_datacenter.dc.id
}
