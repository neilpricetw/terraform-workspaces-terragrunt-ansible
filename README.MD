# Comparing Options for Handling Environment Config in Terraform and remaining DRY

There are multiple ways to configure environment settings in Terraform some are better than others.  This repo evaluates four possible methods with an aim of writing [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) easy to maintain code. 


## Solution Requirements

- 1 solution consisting of EC2 web frontend connecting to RDS Postgres backend and an S3 bucket
- 4 environments in main region and a DR in a different region
- The Prod S3 bucket must have 90 day lifecycle policy wheras it's not required on non-prod
- Resources tagged to easily identify different environments
- Modules versioned??


### Comparisons

Option 1: [Terrafrom TFVars](option1-terraform-tfvars/README.MD)

Option 2: [Terraform Workspaces](option2-terraform-workspaces/README.MD)

Option 3: [Terragrunt](option3-terragrunt/README.MD)

Option 4: [Terragrunt and Ansible](option4-terragrunt-and-ansible/README.MD)


### Conclusion

Tools to run to see how DRY your code is...


### Helpful Links

https://blog.gruntwork.io/how-to-manage-multiple-environments-with-terraform-using-workspaces-98680d89a03e
https://blog.gruntwork.io/how-to-manage-multiple-environments-with-terraform-using-branches-875d1a2ee647
https://blog.gruntwork.io/how-to-manage-multiple-environments-with-terraform-using-terragrunt-2c3e32fc60a8