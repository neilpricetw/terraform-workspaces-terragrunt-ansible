# Option 4: Terragrunt and Ansible

Creating and destroying the environments:


### Dev 
```
ansible-playbook ./ansible/playbooks/dev.yaml
cd non-prod/us-east-1/dev
terragrunt init
terragrunt run-all plan
terragrunt run-all apply --terragrunt-non-interactive

terraform run-all destroy  --terragrunt-non-interactive
```

### Test 
```
ansible-playbook ./ansible/playbooks/test.yaml
cd non-prod/us-east-1/test
terragrunt init
terragrunt run-all plan
terragrunt run-all apply --terragrunt-non-interactive

terraform run-all destroy  --terragrunt-non-interactive
```

### Uat
```
ansible-playbook ./ansible/playbooks/uat.yaml
cd non-prod/us-east-1/uat
terragrunt init
terragrunt run-all plan
terragrunt run-all apply --terragrunt-non-interactive

terraform run-all destroy  --terragrunt-non-interactive
```

### DR
```
ansible-playbook ./ansible/playbooks/dr.yaml
cd non-prod/us-east-2/dr
terragrunt init
terragrunt run-all plan
terragrunt run-all apply --terragrunt-non-interactive

terraform run-all destroy  --terragrunt-non-interactive
```

### Prod 
```
ansible-playbook ./ansible/playbooks/prod.yaml
cd prod/us-east-1/prod
terragrunt init
terragrunt run-all plan
terragrunt run-all apply --terragrunt-non-interactive

terraform run-all destroy  --terragrunt-non-interactive
```


- Pros 
    - Less duplication of folders and files
    - Config for each environment easy to find
    - Adds greater flexibility with if else statement capabilities
    - Less duplication when using multiple providers
    - Terragrunt deploys the modules in correct order; it can also run deployments in parallel if there are no dependencies    
- Cons
    - Need an extra tool outside of Terraform to learn
    - Could potentially add greater complexity to understand the code base
    - Not natively supported with Terraform Cloud
