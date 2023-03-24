### BOOTSTRAP
resource "github_branch_protection_v3" "bootstrap" {
  #repository     = data.github_repository.bootstrap.name
  repository = var.org_bootstrap_repo_name
  branch     = "main"

  restrictions {
    users = ["k0kazpt"]
  }
}

### All other repos relevant for bootstrap
resource "github_repository" "repository" {
  for_each    = var.org_repositories
  name        = each.key
  description = each.value.description
  visibility  = each.value.visibility
}

resource "github_branch_protection_v3" "branch_protection" {
  for_each   = var.org_repositories
  repository = github_repository.repository[each.key].name
  branch     = each.value.branch_protection.branch

  restrictions {
    users = each.value.branch_protection.restrictions.users
  }
}
