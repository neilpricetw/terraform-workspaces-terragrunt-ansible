# Option 3 Terragrunt

## Solution Requirements

- 4 environments: Dev, Test, Uat and Prod
- An S3 bucket per environment with following conifg:
    - all private buckets with different whitelists for different environments
    - just want versioning added to prod
    - tags on the bucket should reflect the environment


