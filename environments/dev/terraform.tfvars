allow_unverified_ssl = true
environment          = "dev"

datacenter = "VCF-Datacenter-Dev"

workload_domain = {
  cluster_name = "wld-dev-01"
  hosts        = ["esxi-d01.vcf.example.com", "esxi-d02.vcf.example.com", "esxi-d03.vcf.example.com"]
  drs_enabled  = true
  ha_enabled   = true
  vsan_enabled = true
}

datastores = {
  nfs-dev = {
    remote_host = "10.10.30.10"
    remote_path = "/exports/dev"
  }
}

edge_cluster_path   = "/infra/sites/default/enforcement-points/default/edge-clusters/edge-dev"
transport_zone_path = "/infra/sites/default/enforcement-points/default/transport-zones/overlay-tz"
tier0_gateway_name  = "t0-vcf-dev"

segments = {
  seg-app = {
    gateway_cidr = "192.168.10.1/24"
  }
}
