# Option 3b: Terragrunt

This is a variation of option3 without the extra folders and the region and account.hcl files to make it easier to manage.

Creating and destroying the environments:


### Dev 
```
cd dev
terragrunt init
terragrunt run-all plan
terragrunt run-all apply --terragrunt-non-interactive

terraform run-all destroy  --terragrunt-non-interactive
```

### Test 
```
cd test
terragrunt init
terragrunt run-all plan
terragrunt run-all apply --terragrunt-non-interactive

terraform run-all destroy  --terragrunt-non-interactive
```

### Uat
```
cd uat
terragrunt init
terragrunt run-all plan
terragrunt run-all apply --terragrunt-non-interactive

terraform run-all destroy  --terragrunt-non-interactive
```

### DR
```
cd dr
terragrunt init
terragrunt run-all plan
terragrunt run-all apply --terragrunt-non-interactive

terraform run-all destroy  --terragrunt-non-interactive
```

### Prod 
```
cd prod
terragrunt init
terragrunt run-all plan
terragrunt run-all apply --terragrunt-non-interactive

terraform run-all destroy  --terragrunt-non-interactive
```


- Pros 
    - Easier to see what is deployed where
    - Can configure separate backends
    - Can configure separate versions
    - Terragrunt deploys the modules in correct order; it can also run deployments in parallel if there are no dependencies
- Cons
    - Need an extra tool outside of Terraform to learn
    - Duplication of folders and files
    - Config spread out across multiple poorly named files (terragrunt.hcl)
    - Not natively supported with Terraform Cloud
