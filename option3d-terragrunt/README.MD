# Option 3d: Terragrunt

Creating and destroying the environments:


### Dev 
```
cd non-prod/us-east-1/dev
terragrunt init
terragrunt run-all plan
terragrunt run-all apply --terragrunt-non-interactive

terraform run-all destroy  --terragrunt-non-interactive
```

### Test 
```
cd non-prod/us-east-1/test
terragrunt init
terragrunt run-all plan --terragrunt-non-interactive
terragrunt run-all apply --terragrunt-non-interactive

terraform run-all destroy  --terragrunt-non-interactive
```

### Uat
```
cd non-prod/us-east-1/uat
terragrunt init
terragrunt run-all plan
terragrunt run-all apply --terragrunt-non-interactive

terraform run-all destroy  --terragrunt-non-interactive
```

### DR
```
cd non-prod/us-east-2/dr
terragrunt init
terragrunt run-all plan
terragrunt run-all apply --terragrunt-non-interactive

terraform run-all destroy  --terragrunt-non-interactive
```

### Prod 
```
cd prod/us-east-1/prod
terragrunt init
terragrunt run-all plan
terragrunt run-all apply --terragrunt-non-interactive

terraform run-all destroy  --terragrunt-non-interactive
```


- Pros 
    - Easier to see what is deployed where
    - Can configure separate backends
    - Can configure separate versions
    - the module hcls are centralised reducing duplication
    - Terragrunt deploys the modules in correct order; it can also run deployments in parallel if there are no dependencies
- Cons
    - Need an extra tool outside of Terraform to learn
    - Config spread out across multiple poorly named files (terragrunt.hcl)
    - Not natively supported with Terraform Cloud
