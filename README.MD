# Comparing Options for Handling Environment Config in Terraform and remaining DRY

There are multiple ways to configure environment settings in Terraform.  This repo evaluates four possible methods with an aim of writing [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) easy to maintain code.


## Solution Requirements

- 1 solution consisting of EC2 web frontend connecting to RDS Postgres backend and an S3 bucket
- 4 environments in main region and a DR in a different region
- The Prod S3 bucket must have 90 day lifecycle policy wheras it's not required on non-prod
- Resources tagged to easily identify different environments


### Comparisons

Option 1: [Terrafrom TFVars](option1-terraform-tfvars/)

Option 2: [Terraform Workspaces](option2-terraform-workspaces/)

Option 2b: [Terraform Workspaces with autovars](option2b-terraform-workspaces-with-autovars)

Option 3: [Terragrunt](option3-terragrunt/)

Option 3b: [Terragrunt (with simplified folder structure and environment config)](option3b-terragrunt/)

Option 4: [Terragrunt and Ansible](option4-terragrunt-and-ansible/)




### Some Useful Links by Terragrunt

[How to manage multiple environments with Terraform using workspaces](https://blog.gruntwork.io/how-to-manage-multiple-environments-with-terraform-using-workspaces-98680d89a03e)

[How to manage multiple environments with Terraform using branches](https://blog.gruntwork.io/how-to-manage-multiple-environments-with-terraform-using-branches-875d1a2ee647)

[How to manage multiple environments with Terraform using Terragrunt](https://blog.gruntwork.io/how-to-manage-multiple-environments-with-terraform-using-terragrunt-2c3e32fc60a8)
