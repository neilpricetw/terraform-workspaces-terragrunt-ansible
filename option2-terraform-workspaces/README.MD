# Comparing Options for Handling Environment Config in Terraform and remaining DRY

There are multiple ways to configure environment settings in Terraform some are better than others.  This repo evaluates four possible methods with an aim of writing [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) easy to maintain code. 


## Option 2: Terrafrom Workspaces

Creating and destroying the environments:


##### Dev 
```
- terraform workspaces new dev
- terraform workspaces select dev
- terraform init
- terraform apply -var-file=terraform-dev.tfvars -auto-approve

- terraform destroy -var-file=terraform-dev.tfvars -auto-approve
```

##### Test
```
- terraform workspaces new test
- terraform workspaces select test
- terraform init
- terraform apply -var-file=terraform-test.tfvars -auto-approve

- terraform destroy -var-file=terraform-test.tfvars -auto-approve
```

##### Uat
```
- terraform workspaces new uat
- terraform workspaces select uat
- terraform init
- terraform apply -var-file=terraform-uat.tfvars -auto-approve

- terraform destroy -var-file=terraform-uat.tfvars -auto-approve
```

##### Prod
```
- terraform workspaces new prod
- terraform workspaces select prod
- terraform init
- terraform apply -var-file=terraform-prod.tfvars -auto-approve

- terraform destroy -var-file=terraform-prod.tfvars -auto-approve
```

- Pros
    - Workspaces is native to Terraform
    - One copy of your code	
    - Works with Terraform Cloud
- Cons
    - Not always easy to know what is deployed where (can’t see the environments in the code itself)
    - One backend for all, no isolation between environments (This is one of the reasons that even HashiCorp’s own documentation does not recommend using Terraform workspaces for managing environments)
    - Unable to run version 1.2 in dev and 1.1 in test, all versions have to be the same therefore it’s not immutable infrastructure
