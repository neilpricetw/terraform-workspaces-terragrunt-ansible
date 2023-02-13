# Option 3b: Terragrunt with bash support

This is a DRY focussed option 3. With bash setting up the environment and region we can reduce the code to one 
terragrunt.hcl file and one var file for each environment. The script also verifies the values we pass in are valid.
This example also uses terraform workspaces to manage the environment, but it could be done with a variable as well.
The main benefit in using workspaces is that we are passing all the variables to submodules which could easily be 
modified but the workspace won't be changed.

Variations/Enhancements:
If there are separate variables per region, we could introduce env directories again with regionally named files.
The bash script can be extended to do account verification and other safety pre-deploy steps.


Creating and destroying the environments:

### Script args
```
./deploy.sh {COMMAND} {ENV} {REGION}

(script executes following)
export TF_WORKSPACE=$env
terragrunt init
terragrunt apply
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
./deploy.sh apply dr us-east-1

./deploy.sh destroy dr us-east-1
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
- Cons
    - Need an extra tool outside of Terraform to learn
    - Not natively supported with Terraform Cloud
    - Can be difficult to comprehend with Bash executing Terragrunt executing Terraform
