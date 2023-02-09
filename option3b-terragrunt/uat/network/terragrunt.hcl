include "root" {
  path = find_in_parent_folders()
}

locals {

  common_vars = read_terragrunt_config(find_in_parent_folders("common_vars.hcl"))
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  env = local.environment_vars.locals.environment
  environment_owner = local.environment_vars.locals.environment_owner  
  region = local.environment_vars.locals.region
  tech_owner = local.environment_vars.locals.tech_owner
  prefix = local.common_vars.locals.prefix

}

terraform {
  source = "../../../modules//network"
}

inputs = {
    environment = local.env
    environment_owner = local.environment_owner

    // Network
    vpc_cidr     = "10.0.0.0/16"     
    subnet1_cidr = "10.0.1.0/24"     
    subnet2_cidr = "10.0.2.0/24"     
    subnet3_cidr = "10.0.3.0/24"  
    subnet4_cidr = "10.0.4.0/24"  

    region = local.region
    prefix = local.prefix
    tech_owner = local.tech_owner

}
