organization_name            = "cheese-shop"
organization_email           = "k0kazpt@gmail.com"
workspaces = {
  "terraform-cloud-bootstrap" = {
    description        = "For Terraform Cloud deployment bootstrap"
    execution_mode     = "remote"
    auto_apply         = true
    terraform_version  = "~> 1.4.0"
    working_directory  = "/automation/cheese_shop/terraform_cloud"
    vcs_repo           = [
      {
        repository = "bootstrap"
        branch = "main"
        oauth_token_id = "ot-WwTiHQLQykekmhjk"
      }
    ]
  }
  #"github-bootstrap" = {
  #  description        = "For GitHub deployment bootstrap"
  #  execution_mode     = "remote"
  #  auto_apply         = true
  #  terraform_version  = "~> 1.4.0"
  #  working_directory  = "/automation/cheese_shop/github"
  #  vcs_repo           = [
  #    {
  #      repository = "bootstrap"
  #      branch = "main"
  #    }
  #  ]
  #}

}
