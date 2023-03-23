### SECRETS
data "doppler_secrets" "this" {}

### OTHER RESOURCES
resource "tfe_organization" "org" {
  name  = var.organization_name
  email = var.organization_email
}

resource "tfe_oauth_client" "github" {
  name             = "github-oauth-client"
  organization     = tfe_organization.org.name
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = data.doppler_secrets.this.map.TFE_GH_TOKEN
  service_provider = "github"
}

resource "tfe_workspace" "workspace" {
  for_each           = var.workspaces
  name               = each.key
  organization       = tfe_organization.org.name
  terraform_version  = lookup(each.value, "terraform_version", null)
  description        = each.value.description
  execution_mode     = each.value.execution_mode
  allow_destroy_plan = lookup(each.value, "allow_destroy_plan", null)
  auto_apply         = lookup(each.value, "auto_apply", null)
  working_directory  = lookup(each.value, "working_directory", null)
  trigger_prefixes   = lookup(each.value, "trigger_prefixes", null)
  trigger_patterns   = lookup(each.value, "trigger_patterns", null)

  dynamic "vcs_repo" {
    for_each = toset(lookup(each.value, "vcs_repo", []))
    content {
      identifier     = "${var.organization_name}/${vcs_repo.value["repository"]}"
      branch         = vcs_repo.value["branch"]
      oauth_token_id = tfe_oauth_client.github.oauth_token_id
    }
  }
}

resource "tfe_variable" "variable" {
  for_each     = var.workspace_variables
  key          = each.key
  value        = each.value.value
  category     = each.value.category
  workspace_id = tfe_workspace.workspace[each.value.workspace_key].id
  description  = each.value.description
  sensitive    = lookup(each.value, "sensitive", null)
  hcl          = lookup(each.value, "hcl", null)
}
