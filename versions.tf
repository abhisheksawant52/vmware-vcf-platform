terraform {
  required_version = ">= 1.5.0"

  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "~> 2.8"
    }
    nsxt = {
      source  = "vmware/nsxt"
      version = "~> 3.7"
    }
  }

  # Remote state backend. Configure per environment with a partial backend:
  #   terraform init -backend-config=environments/dev/backend.hcl
  #
  # backend "s3" {
  #   bucket = "vcf-platform-tfstate"
  #   key    = "vcf-platform/terraform.tfstate"
  #   region = "eu-west-1"
  # }
}
