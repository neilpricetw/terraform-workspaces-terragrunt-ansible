include "root" {
  path = find_in_parent_folders()
}

locals {

  common_vars = read_terragrunt_config(find_in_parent_folders("common_vars.hcl"))
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  env = local.environment_vars.locals.environment
  environment_owner = local.environment_vars.locals.environment_owner
  db_instance_class = local.environment_vars.locals.db_instance_class
  region = local.environment_vars.locals.region
  tech_owner = local.environment_vars.locals.tech_owner
  prefix = local.common_vars.locals.prefix
  db_name = local.common_vars.locals.db_name  
  db_user = local.common_vars.locals.db_user

}

terraform {
  source = "../../../modules//rds"
}

inputs = {
    environment = local.env
    environment_owner = local.environment_owner

    // RDS
    db_instance_class = local.db_instance_class
    db_name = local.db_name
    db_user = local.db_user
    
    vpc_id = dependency.network.outputs.vpc_id
    vpc_cidr = dependency.network.outputs.vpc_cidr
    subnet_private_1_id = dependency.network.outputs.subnet_private_1_id
    subnet_private_2_id = dependency.network.outputs.subnet_private_2_id

    region = local.region
    prefix = local.prefix
    tech_owner = local.tech_owner

}

dependency "network" {
    config_path = "../network"
    skip_outputs = false

    mock_outputs = {
        vpc_id = "vpc123"
        vpc_cidr = "10.2.0.0/16"
        subnet_private_1_id = "subnet123"
        subnet_private_2_id = "subnet124"
    }
}