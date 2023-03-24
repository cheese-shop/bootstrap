# Terraform Cloud automation
This folder will contain Terraform code that will help in automation of initial Terraform Cloud configs.

In the scope of this project, Terraform Cloud will hold the state files for every IaC environment, in the respective workspace.
For this workspace in particular, Terraform Cloud is integrated with VCS and execution is remote. In other words, CI/CD is working via TF Cloud.
So after creating the workspaces, the backend of each Terraform IaC deployment must point to its respective Terraform Cloud workspace.

The two main execution folders relate to TF CLoud and GitHub bootstrapping and should only be executed in the following order:
1. Terraform Cloud: This will set up the workspaces. So all deployments depend on a workspace so this should be checked / executed first.
2. GitHub: This will set up some initial confs and repos, from which the rest of the architecture can be built.

# Pending
* This automation procedure is simplified to jumpstart next steps. Acknowledged improvements are:
  * Terraform module creation and repo separation of configs and source;

# Instructions
This code folder is integrated with TF Cloud. Git changes will trigger runs there.

## Bootstrap
On how to bootstrap this and similar repos: https://cheeseshop.atlassian.net/wiki/spaces/DEVOPS/pages/3211277/Terraform+state+in+TF+Cloud

# Local setup

* To perform changes:
  * `cd automation\terraform_cloud`
  * Follow  instructions here: https://cheeseshop.atlassian.net/wiki/spaces/DEVOPS/pages/2949121/On+local+setup

* **IMPORTANT:** From the point this is integrated into VCS and TF Cloud, all Terraform runs will be executed remotely in TF Cloud.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.4.0 |
| <a name="requirement_doppler"></a> [doppler](#requirement\_doppler) | ~> 1.1.0 |
| <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) | ~> 0.43.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_doppler"></a> [doppler](#provider\_doppler) | 1.1.7 |
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | 0.43.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tfe_organization.org](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/organization) | resource |
| [tfe_variable.variable](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable) | resource |
| [tfe_workspace.workspace](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |
| [doppler_secrets.this](https://registry.terraform.io/providers/DopplerHQ/doppler/latest/docs/data-sources/secrets) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_doppler_token"></a> [doppler\_token](#input\_doppler\_token) | Doppler auth token for secret retrieval. | `string` | `""` | no |
| <a name="input_oauth_token"></a> [oauth\_token](#input\_oauth\_token) | OAuth token for VCS integration (GitHub). May not be used in favor of secret manager integration. | `string` | `""` | no |
| <a name="input_organization_email"></a> [organization\_email](#input\_organization\_email) | Terraform Cloud Organization email. | `string` | n/a | yes |
| <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name) | Terraform Cloud Organization name. | `string` | n/a | yes |
| <a name="input_terraform_cloud_org_token"></a> [terraform\_cloud\_org\_token](#input\_terraform\_cloud\_org\_token) | Terraform Cloud organization. Only used in unattended scenarios (ex: CI/CD pipeline). | `string` | `""` | no |
| <a name="input_workspace_variables"></a> [workspace\_variables](#input\_workspace\_variables) | Map containing all variables of the Terraform Cloud workspace.<br>https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace<br>Example:<pre>workspace_variables = {<br>  var1 = {<br>    workspace_key = "workspace1" # Must match the key defined for the workspace in the workspaces variable.<br>    value = value1<br>    category = "env"<br>    sensitive = false<br>    description = "a useful description"<br><br>  }<br>}</pre> | `map(any)` | `{}` | no |
| <a name="input_workspaces"></a> [workspaces](#input\_workspaces) | Map containing all workspaces and respective configurations for Terraform Cloud.<br>https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable<br>Example:<pre>workspaces = {<br>  "workspace1" = {<br>    description        = "For Workspace 1"<br>    execution_mode     = "local"<br>  }<br>  "workspace2" = {<br>    description        = "For Workspace 2"<br>    execution_mode     = "remote"<br>    terraform_version  = "~> 1.4.0"<br>    working_directory  = "./working/directory"<br>    auto_apply         = true<br>    trigger_prefixes   = ["./some/path", "./some/other/path"]<br>    vcs_repo           = [<br>      {<br>        branch = "main"<br>      }<br>    ]<br>  }<br>}</pre> | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
