# Option 3c: Terragrunt with bash support

This is a DRY focussed terragrunt option. With bash setting up the environment and region we can reduce the code to one 
terragrunt.hcl file and one var file for each environment. The script also verifies the values we pass in are valid.

This example also uses terraform workspaces to manage the environment instead of a variable as a minor improvement.
If we use a variable, we would have an input for the env:
  - in the script {./deploy.sh {COMMAND} {ENV}...} 
  - in the vars/env file for each environment (to pass it to the main.tf in modules-option3c)  {environment = dev} 
  - in the main.tf (to pass to each of the submodules) {env = var.environment}

This leads to a lot of places the env can be modified part way during the deployment
By using terraform workspaces we can set it in the original script invocation and use the workspace to access it
which will reduce the number of times it is passed on.
It is currently only used in the module, but can also be used in backend configuration, providers, etc

### Variations/Enhancements:
 - If there are separate variables per region, we could introduce env directories again with regionally named files.
 - The bash script can be extended to do account verification and other safety pre-deploy steps.


## Creating and destroying the environments:

### Script args
```
./deploy.sh {COMMAND} {ENV} {REGION}

(script executes following)
export TF_WORKSPACE=$env
terragrunt init
terragrunt {COMMAND}
```

### Dev 
```
./deploy.sh apply dev us-east-1 

./deploy.sh destroy dev us-east-1
```

### Test 
```
./deploy.sh apply test us-east-1

./deploy.sh destroy test us-east-1
```

### Uat
```
./deploy.sh apply uat us-east-1

./deploy.sh destroy uat us-east-1
```

### DR
```
./deploy.sh apply dr us-east-2

./deploy.sh destroy dr us-east-2
```

### Prod 
```
./deploy.sh apply prod us-east-1

./deploy.sh destroy prod us-east-1
```


- Pros 
    - No duplication of code
    - Easier to see what is deployed where
    - Can configure separate backends
    - Can configure separate versions
    - Great for single solutions / teams
    - Terragrunt deploys the modules in correct order; it can also run deployments in parallel if there are no dependencies
- Cons
    - Need an extra tool outside of Terraform to learn
    - Not natively supported with Terraform Cloud
    - Can be difficult to comprehend with Bash executing Terragrunt executing Terraform
    - Difficult to use if multiple teams use the same module pool as it's all or nothing or complex conditionals in the hcl file at the root of the modules folder
    - The use of env vars means you could have issues deploying using the same CI/CD infrastructure, must use containers to get around this
