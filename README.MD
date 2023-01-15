# Comparing Options for Handling Config in Terraform

## Solution Requirements

- 4 environments: Dev, Test, Uat and Prod
- An S3 bucket per environment with following conifg:
    - all private buckets with different whitelists for different environments
    - just want versioning added to prod
    - tags on the bucket should reflect the environment


### Comparisons


#### 1. Terraform (main branch)

```
- terraform init
- terraform apply -var-file=terraform-dev.tfvars -auto-approve
- terraform apply -var-file=terraform-test.tfvars -auto-approve
```

Negatives: when re-running for a different environment you end up destroying one to create the other


#### 2. Workspaces (workspaces branch)

```
- terraform init
- terraform apply -var-file=terraform-dev.tfvars -auto-approve
- terraform workspaces new test
- terraform workspaces select test
- terraform apply -var-file=terraform-test.tfvars -auto-approve
```

Negatives: 


#### 3. Terragrunt (terragrunt branch)

```
- terraform init

```

Negatives: 


#### 4. Ansible (ansible branch)