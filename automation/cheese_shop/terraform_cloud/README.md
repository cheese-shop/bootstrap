# Terraform Cloud automation
This folder will contain Terraform code that will help in automation of Terraform Cloud configs.

In the scope of this project, Terraform Cloud will hold the state files for every IaC environment, in the respective workspace.
So after creating the workspaces, the backend of each Terraform IaC deployment must point to its respective Terraform Cloud workspace.

# Pending
* This automation procedure is simplified to jumpstart next steps. Acknowledged improvements are:
  * Terraform module creation and repo separation of configs and source;
  * Pipeline integration;

# Instructions
Currently there is no pipeline for this process, so this will have to be run manually on the operator's local machine.

## Bootstrap
The first time you run this automation to create Terraform Cloud Workspaces, it will run using the default local backend. After the workspaces are created, we can then reconfigure the backend to point to the created workspaces, so that state files are stored remotely.
To do this:
* Add the Terraform Cloud backend configs in the `terraform` block. Example):
  ```
  terraform {
    cloud {
      organization = "cheese-shop"

      workspaces {
        name = "terraform-cloud"
      }
    }
  }
  ```
* Run `terraform init`. You will be asked to migrate your local state to the Terraform Cloud workspace. Answer "yes" as show below:
  ```
  Initializing Terraform Cloud...
  Do you wish to proceed?
    As part of migrating to Terraform Cloud, Terraform can optionally copy your
    current workspace state to the configured Terraform Cloud workspace.

    Answer "yes" to copy the latest state snapshot to the configured
    Terraform Cloud workspace.

    Answer "no" to ignore the existing state and just activate the configured
    Terraform Cloud workspace with its existing state, if any.

    Should Terraform migrate your existing state?

    Enter a value: yes
  ```
* **Done!!** Now your state files are no longer stored locally. You can proceed working normally following the instructions in the "Local setup" section. Also, you can check your state files in Terraform Cloud as shown next: ![TF Cloud State in Workspace](docs/images/TF_Cloud_state.png "TF Cloud State in Workspace")

# Local setup

* To perform changes:
  * `cd automation\terraform_cloud`
  * Follow  instructions here: https://cheeseshop.atlassian.net/wiki/spaces/DEVOPS/pages/2949121/On+local+setup
