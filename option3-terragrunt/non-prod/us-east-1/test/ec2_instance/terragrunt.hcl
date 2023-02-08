include "root" {
  path = find_in_parent_folders()
}

locals {

  common_vars = read_terragrunt_config(find_in_parent_folders("common_vars.hcl"))
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
  env = local.environment_vars.locals.environment
  environment_owner = local.environment_vars.locals.environment_owner
  ec2_instance_type = local.environment_vars.locals.ec2_instance_type
  ec2_root_volume_size = local.environment_vars.locals.ec2_root_volume_size    
  region = local.region_vars.locals.region
  tech_owner = local.account_vars.locals.tech_owner
  prefix = local.common_vars.locals.prefix

}

terraform {
  source = "../../../../../modules//ec2_instance"
}

inputs = {
    environment = local.env
    environment_owner = local.environment_owner

    // EC2
    ec2_instance_type = local.ec2_instance_type
    root_volume_size = local.ec2_root_volume_size
    vpc_id = dependency.network.outputs.vpc_id
    subnet_public_1_id = dependency.network.outputs.subnet_public_1_id

    s3_bucket_name = dependency.s3_bucket.outputs.bucket_name

    region = local.region
    prefix = local.prefix
    tech_owner = local.tech_owner

}

dependency "network" {
    config_path = "../network"
    skip_outputs = false

    mock_outputs = {
        vpc_id = "vpc123"
        subnet_public_1_id = "subnet123"
    }
}

dependency "s3_bucket" {
    config_path = "../s3_bucket"
    skip_outputs = false

    mock_outputs = {
        bucket_name = "mybucket"
    }
}