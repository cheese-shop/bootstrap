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
  owner = "cheese-shop"
  #owner = "k0kazpt"
}
