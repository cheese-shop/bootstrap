### Locals
locals {
  # precommit ci installation id
  precommit_ci_id = "35531567"
}

resource "github_app_installation_repositories" "pre-commit-ci-repos" {
  # The installation id of the app (in the organization).
  installation_id       = local.precommit_ci_id
  selected_repositories = [var.org_bootstrap_repo_name]
}
