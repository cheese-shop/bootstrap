variable "terraform_cloud_org_token" {
  description = "Terraform Cloud organization. Only used in unattended scenarios (ex: CI/CD pipeline)."
  type        = string
  sensitive   = true
  default     = ""
}

variable "organization_name" {
  description = "Terraform Cloud Organization name."
  type        = string
}

variable "organization_email" {
  description = "Terraform Cloud Organization email."
  type        = string
}

variable "oauth_token" {
  type        = string
  sensitive   = true
  description = "OAuth token for VCS integration (GitHub)"
}

variable "workspaces" {
  description = <<EOT
Map containing all workspaces and respective configurations for Terraform Cloud.
https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/variable
Example:
```
workspaces = {
  "workspace1" = {
    description        = "For Workspace 1"
    execution_mode     = "local"
  }
  "workspace2" = {
    description        = "For Workspace 2"
    execution_mode     = "remote"
    terraform_version  = "~> 1.4.0"
    working_directory  = "./working/directory"
    auto_apply         = true
    trigger_prefixes   = ["./some/path", "./some/other/path"]
    vcs_repo           = [
      {
        branch = "main"
      }
    ]
  }
}
```
EOT
  type        = any
}

variable "workspace_variables" {
  description = <<EOT
Map containing all variables of the Terraform Cloud workspace.
https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace
Example:
```
workspace_variables = {
  var1 = {
    workspace_key = "workspace1" # Must match the key defined for the workspace in the workspaces variable.
    value = value1
    category = "env"
    sensitive = false
    description = "a useful description"

  }
}
```
EOT
  type        = map(any)
  default     = {}
}
