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
  source = "../../../modules//s3_bucket"
}

inputs = {
    environment = local.env
    environment_owner = local.environment_owner

    allowed_ips = [ "1.1.1.1", "2.2.2.2" ]

    region = local.region
    prefix = local.prefix
    tech_owner = local.tech_owner

}
