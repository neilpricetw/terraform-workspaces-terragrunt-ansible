# Option 2: Terrafrom Workspaces

Creating and destroying the environments:


### Dev 
```
terraform init
terraform workspace new dev
terraform workspace select dev
terraform plan
terraform apply -auto-approve

terraform destroy -auto-approve
```

### Test
```
terraform init
terraform workspace new test
terraform workspace select test
terraform plan
terraform apply -auto-approve

terraform destroy -auto-approve
```

### Uat
```
terraform init
terraform workspace new uat
terraform workspace select uat
terraform plan
terraform apply -auto-approve

terraform destroy -auto-approve
```

### DR
```
terraform init
terraform workspace new dr
terraform workspace select dr
terraform plan
terraform apply -auto-approve

terraform destroy -auto-approve
```

### Prod
```
terraform init
terraform workspace new prod
terraform workspace select prod
terraform plan
terraform apply -auto-approve

terraform destroy -auto-approve
```

- Pros
    - Workspaces is native to Terraform
    - One copy of your code
    - Works with Terraform Cloud
    - Don't need to specify varfiles as the config for your workspace is automatically picked up
    - Possible to use prod config as a base and only override what you need to keeping config as close to prod as possible
- Cons
    - Custom Terraform logic to pick up config which needs to be maintained and can seem a little magical
    - Terraform doesn't support deep merges so overridable configuration needs to be on a single layer
    - Terraform doesn't support maps of differing objects meaning the type of the configuration needs to be 'any'
    - As the configuration is loaded as an 'any' type, there's no nice way to enforce type
    - Not always easy to know what is deployed where (can’t see the environments in the code itself)
    - One backend for all, no isolation between environments (This is one of the reasons that even HashiCorp’s own documentation does not recommend using Terraform workspaces for managing environments)
    - Unable to run version 1.2 in dev and 1.1 in test, all versions have to be the same therefore it’s not immutable infrastructure
