variable "org_billing_email" {
  description = "Billing email for the organization"
  type        = string
}

variable "org_email" {
  description = "Main email for the organization"
  type        = string
}

variable "org_company" {
  description = "Company name for the organization"
  type        = string
}

variable "org_name" {
  description = "Name for the organization"
  type        = string
}

variable "org_description" {
  description = "Description for the organization"
  type        = string
}

variable "org_bootstrap_repo_name" {
  description = "Name of bootstrap repository"
  type        = string
}

variable "org_repositories" {
  type        = any
  description = <<EOT
  Map of bootstrap related repos and respective configurations"
  Example:
  ```
  org_repositories = {
    "github-manager" = {
      description = "Contains all GitHub configurations"
      visibility = "public"
      branch_protection = {
        branch       = "main"
        restrictions = {
          users = ["k0kazpt"]
        }
      }
    }
  }
  ```
  EOT
}

variable "doppler_token" {
  type        = string
  sensitive   = true
  description = "Doppler auth token for secret retrieval."
  default     = ""
}
