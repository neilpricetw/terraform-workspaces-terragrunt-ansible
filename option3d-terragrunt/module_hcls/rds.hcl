locals {

  common_vars = read_terragrunt_config(find_in_parent_folders("common_vars.hcl"))
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  env = local.environment_vars.locals.environment
  environment_owner = local.environment_vars.locals.environment_owner
  db_instance_class = local.environment_vars.locals.db_instance_class
  region = local.region_vars.locals.region
  tech_owner = local.account_vars.locals.tech_owner
  account_name = local.account_vars.locals.account_name    
  prefix = local.common_vars.locals.prefix
  db_name = local.common_vars.locals.db_name  
  db_user = local.common_vars.locals.db_user

}

terraform {
  source = "${dirname(find_in_parent_folders("common_vars.hcl"))}/../modules//rds"
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
    config_path = "${dirname(find_in_parent_folders("common_vars.hcl"))}/${local.account_name}/${local.region}/${local.env}/network"
    skip_outputs = false

    mock_outputs = {
        vpc_id = "vpc123"
        vpc_cidr = "10.2.0.0/16"
        subnet_private_1_id = "subnet123"
        subnet_private_2_id = "subnet124"
    }
}