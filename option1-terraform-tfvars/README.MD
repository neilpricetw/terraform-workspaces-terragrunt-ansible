# Comparing Options for Handling Environment Config in Terraform and remaining DRY

There are multiple ways to configure environment settings in Terraform some are better than others.  This repo evaluates four possible methods with an aim of writing [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) easy to maintain code. 


## Option 1: Terrafrom TFVars

Creating and destroying the environments:


##### Dev 
```
- terraform init
- terraform apply -var-file=terraform-dev.tfvars -auto-approve

- terraform destroy -var-file=terraform-dev.tfvars -auto-approve
```

##### Test
```
- terraform init
- terraform apply -var-file=terraform-test.tfvars -auto-approve

- terraform destroy -var-file=terraform-test.tfvars -auto-approve
```

##### Uat
```
- terraform init
- terraform apply -var-file=terraform-uat.tfvars -auto-approve

- terraform destroy -var-file=terraform-uat.tfvars -auto-approve
```

##### Prod
```
- terraform init
- terraform apply -var-file=terraform-prod.tfvars -auto-approve

- terraform destroy -var-file=terraform-prod.tfvars -auto-approve
```

- Pros
    - TFVars is native to Terraform
    - One copy of your code	
    - Easier to know what is deployed where
    - Works with Terraform Cloud
- Cons
    - When re-running Terraform for a different environments you destroy one to create the other as they share the same state file
        - You could avoid this by scripting a dynamic change to backend.tf in the CI/CD process, but then it's not reflected in code
        - You could have a branch per environment but that would create a lot of duplication and extra overhead plus promoting changes from one environment to another could be error prone too
    - Unable to run version 1.2 in dev and 1.1 in test, all versions have to be the same therefore it’s not immutable infrastructure
