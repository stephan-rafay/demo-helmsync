terraform {
  required_providers {
    rafay = {
      #version = "= 1.1.26"
      #source = "registry.terraform.io/RafaySystems/rafay"
      version = "= 1.0.1"
      source = "app.terraform.io/tfcd/rafay"
    }
  }
}

provider "rafay" { 
  # Configuration options 
  provider_config_file = var.rafay_config_file
}

