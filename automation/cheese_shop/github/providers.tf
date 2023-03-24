terraform {
  required_version = "~> 1.4.0"

  cloud {
    organization = "cheese-shop"

    workspaces {
      name = "github-bootstrap"
    }
  }

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.18.0"
    }
    doppler = {
      source  = "DopplerHQ/doppler"
      version = "~> 1.1.0"
    }
  }
}

provider "github" {
  owner = var.org_name
  token = data.doppler_secrets.this.map.ORG_GH_TOKEN
}

provider "doppler" {
  doppler_token = var.doppler_token
}
