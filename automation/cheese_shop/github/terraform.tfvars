org_billing_email       = "k0kazpt@gmail.com"
org_company             = "Cheese Shop"
org_email               = "k0kazpt@gmail.com"
org_name                = "cheese-shop"
org_description         = "Every kind of cheese..."
org_bootstrap_repo_name = "bootstrap"

org_repositories = {
  "reusable-workflows" = {
    description = "Library containing all GitHub reusable workflows."
    visibility  = "public"
    branch_protection = {
      branch = "main"
      restrictions = {
        users = ["k0kazpt"]
      }
    }
  }
  "terraform-modules" = {
    description = "Library contains all private Terraform modules."
    visibility  = "public"
    branch_protection = {
      branch = "main"
      restrictions = {
        users = ["k0kazpt"]
      }
    }
  }
  "github-manager" = {
    description = "Contains all GitHub configurations (except bootstrap)."
    visibility  = "public"
    branch_protection = {
      branch = "main"
      restrictions = {
        users = ["k0kazpt"]
      }
    }
  }
}
