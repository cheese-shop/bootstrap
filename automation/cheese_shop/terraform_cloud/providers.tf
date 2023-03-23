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
      version = "~> 0.42.0"
    }
  }
}
