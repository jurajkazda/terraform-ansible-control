terraform {
  required_providers {
    oci = {
      source  = "oracle/oci"
      version = ">= 6.9.0"
    }
  }
  required_version = ">= 1.2"
}

# Configure the OCI provider
provider "oci" {
  config_file_profile = "AFP"
}
