# Comparing Options for Handling Environment Config in Terraform and remaining DRY

There are multiple ways to configure environment settings in Terraform some are better than others.  This repo evaluates four possible methods with an aim of writing [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) easy to maintain code. 


## Option 4: Terragrunt and Ansible

Creating and destroying the environments:


##### Dev 
```
terraform workspaces new dev
terraform workspaces select dev
terraform init
terraform apply -var-file=terraform-dev.tfvars -auto-approve

terraform destroy -var-file=terraform-dev.tfvars -auto-approve
```

##### Test
```
terraform workspaces new test
terraform workspaces select test
terraform init
terraform apply -var-file=terraform-test.tfvars -auto-approve

terraform destroy -var-file=terraform-test.tfvars -auto-approve
```

##### Uat
```
terraform workspaces new uat
terraform workspaces select uat
terraform init
terraform apply -var-file=terraform-uat.tfvars -auto-approve

terraform destroy -var-file=terraform-uat.tfvars -auto-approve
```

##### Prod
```
terraform workspaces new prod
terraform workspaces select prod
terraform init
terraform apply -var-file=terraform-prod.tfvars -auto-approve

terraform destroy -var-file=terraform-prod.tfvars -auto-approve
```

- Pros
    - Less duplication of folders and files
    - Config for each environment easy to find
    - Adds greater flexibility with if else statement capabilities
    - Less duplication when using multiple providers
- Cons
    - Need an extra tool outside of Terraform to learn
    - Could add greater complexity to understand the code base
    - Not natively supported with Terraform Cloud
