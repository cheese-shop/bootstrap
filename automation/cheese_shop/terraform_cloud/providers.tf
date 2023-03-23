terraform {
  required_version = "~> 1.4.0"

  cloud {
    organization = "cheese-shop"

    workspaces {
      name = "terraform-cloud-bootstrap"
    }
  }

  required_providers {
    tfe = {
      version = "~> 0.43.0"
    }
    doppler = {
      source  = "DopplerHQ/doppler"
      version = "~> 1.1.0"
    }
  }
}

provider "doppler" {
  doppler_token = var.doppler_token
}
