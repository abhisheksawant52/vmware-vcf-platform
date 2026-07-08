allow_unverified_ssl = false
environment          = "prod"

datacenter = "VCF-Datacenter-Prod"

workload_domain = {
  cluster_name = "wld-prod-01"
  hosts        = ["esxi-p01.vcf.example.com", "esxi-p02.vcf.example.com", "esxi-p03.vcf.example.com", "esxi-p04.vcf.example.com", "esxi-p05.vcf.example.com", "esxi-p06.vcf.example.com"]
  drs_enabled  = true
  ha_enabled   = true
  vsan_enabled = true
}

datastores = {
  nfs-prod = {
    remote_host = "10.20.30.10"
    remote_path = "/exports/prod"
  }
  nfs-backup = {
    remote_host = "10.20.30.11"
    remote_path = "/exports/backup"
  }
}

edge_cluster_path   = "/infra/sites/default/enforcement-points/default/edge-clusters/edge-prod"
transport_zone_path = "/infra/sites/default/enforcement-points/default/transport-zones/overlay-tz"
tier0_gateway_name  = "t0-vcf-prod"

segments = {
  seg-app = {
    gateway_cidr = "192.168.110.1/24"
  }
  seg-db = {
    gateway_cidr = "192.168.120.1/24"
  }
  seg-web = {
    gateway_cidr = "192.168.130.1/24"
  }
}
