# Option 2: Terrafrom Workspaces

Creating and destroying the environments:


### Dev 
```
terraform init
terraform workspace new dev
terraform workspace select dev
terraform plan -var-file=terraform-dev.tfvars -var-file=non-prod.tfvars
terraform apply -var-file=terraform-dev.tfvars -var-file=non-prod.tfvars -auto-approve

terraform destroy -var-file=terraform-dev.tfvars -var-file=non-prod.tfvars -auto-approve
```

### Test
```
terraform init
terraform workspace new test
terraform workspace select test
terraform plan -var-file=terraform-test.tfvars -var-file=non-prod.tfvars
terraform apply -var-file=terraform-test.tfvars -var-file=non-prod.tfvars -auto-approve

terraform destroy -var-file=terraform-test.tfvars -var-file=non-prod.tfvars -auto-approve
```

### Uat
```
terraform init
terraform workspace new uat
terraform workspace select uat
terraform plan -var-file=terraform-uat.tfvars -var-file=non-prod.tfvars
terraform apply -var-file=terraform-uat.tfvars -var-file=non-prod.tfvars -auto-approve

terraform destroy -var-file=terraform-uat.tfvars -var-file=non-prod.tfvars -auto-approve
```

### DR
```
terraform init
terraform workspace new dr
terraform workspace select dr
terraform plan -var-file=terraform-dr.tfvars -var-file=non-prod.tfvars
terraform apply -var-file=terraform-dr.tfvars -var-file=non-prod.tfvars -auto-approve

terraform destroy -var-file=terraform-dr.tfvars -var-file=non-prod.tfvars -auto-approve
```

### Prod
```
terraform init
terraform workspace new prod
terraform workspace select prod
terraform plan -var-file=terraform-prod.tfvars
terraform apply -var-file=terraform-prod.tfvars -auto-approve

terraform destroy -var-file=terraform-prod.tfvars -auto-approve
```

- Pros
    - Workspaces is native to Terraform
    - One copy of your code	
    - Works with Terraform Cloud
- Cons
    - Not always easy to know what is deployed where (can’t see the environments in the code itself)
    - One backend for all, no isolation between environments (This is one of the reasons that even HashiCorp’s own documentation does not recommend using Terraform workspaces for managing environments)
    - Unable to run version 1.2 in dev and 1.1 in test, all versions have to be the same therefore it’s not immutable infrastructure
