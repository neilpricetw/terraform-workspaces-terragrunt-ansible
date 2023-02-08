# Option 1: Terrafrom TFVars

Creating and destroying the environments:


### Dev 
```
terraform init
terraform plan -var-file=terraform-dev.tfvars -var-file=non-prod.tfvars
terraform apply -var-file=terraform-dev.tfvars -var-file=non-prod.tfvars -auto-approve

terraform destroy -var-file=terraform-dev.tfvars -var-file=non-prod.tfvars -auto-approve
```

### Test
```
terraform init
terraform plan -var-file=terraform-test.tfvars -var-file=non-prod.tfvars
terraform apply -var-file=terraform-test.tfvars -var-file=non-prod.tfvars -auto-approve

terraform destroy -var-file=terraform-test.tfvars -var-file=non-prod.tfvars -auto-approve
```

### Uat
```
terraform init
terraform plan -var-file=terraform-uat.tfvars -var-file=non-prod.tfvars
terraform apply -var-file=terraform-uat.tfvars -var-file=non-prod.tfvars -auto-approve

terraform destroy -var-file=terraform-uat.tfvars -var-file=non-prod.tfvars -auto-approve
```

### DR
```
terraform init
terraform plan -var-file=terraform-dr.tfvars -var-file=non-prod.tfvars
terraform apply -var-file=terraform-dr.tfvars -var-file=non-prod.tfvars -auto-approve

terraform destroy -var-file=terraform-dr.tfvars -var-file=non-prod.tfvars -auto-approve
```

### Prod
```
terraform init
terraform plan -var-file=terraform-prod.tfvars
terraform apply -var-file=terraform-prod.tfvars -auto-approve

terraform destroy -var-file=terraform-prod.tfvars -auto-approve
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
