# GitHub automation


# Pending


# Instructions

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.4.0 |
| <a name="requirement_doppler"></a> [doppler](#requirement\_doppler) | ~> 1.1.0 |
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 5.18.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_doppler"></a> [doppler](#provider\_doppler) | 1.1.7 |
| <a name="provider_github"></a> [github](#provider\_github) | 5.18.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_app_installation_repositories.pre-commit-ci-repos](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/app_installation_repositories) | resource |
| [github_branch_protection_v3.bootstrap](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection_v3) | resource |
| [github_branch_protection_v3.branch_protection](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/branch_protection_v3) | resource |
| [github_organization_settings.test](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/organization_settings) | resource |
| [github_repository.repository](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [doppler_secrets.this](https://registry.terraform.io/providers/DopplerHQ/doppler/latest/docs/data-sources/secrets) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_doppler_token"></a> [doppler\_token](#input\_doppler\_token) | Doppler auth token for secret retrieval. | `string` | `""` | no |
| <a name="input_org_billing_email"></a> [org\_billing\_email](#input\_org\_billing\_email) | Billing email for the organization | `string` | n/a | yes |
| <a name="input_org_bootstrap_repo_name"></a> [org\_bootstrap\_repo\_name](#input\_org\_bootstrap\_repo\_name) | Name of bootstrap repository | `string` | n/a | yes |
| <a name="input_org_company"></a> [org\_company](#input\_org\_company) | Company name for the organization | `string` | n/a | yes |
| <a name="input_org_description"></a> [org\_description](#input\_org\_description) | Description for the organization | `string` | n/a | yes |
| <a name="input_org_email"></a> [org\_email](#input\_org\_email) | Main email for the organization | `string` | n/a | yes |
| <a name="input_org_name"></a> [org\_name](#input\_org\_name) | Name for the organization | `string` | n/a | yes |
| <a name="input_org_repositories"></a> [org\_repositories](#input\_org\_repositories) | Map of bootstrap related repos and respective configurations"<br>  Example:<pre>org_repositories = {<br>    "github-manager" = {<br>      description = "Contains all GitHub configurations"<br>      visibility = "public"<br>      branch_protection = {<br>        branch       = "main"<br>        restrictions = {<br>          users = ["k0kazpt"]<br>        }<br>      }<br>    }<br>  }</pre> | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
