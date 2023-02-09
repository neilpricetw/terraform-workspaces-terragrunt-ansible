locals {
  common_vars = read_terragrunt_config(find_in_parent_folders("common_vars.hcl"))
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "ccf-terraform-backend"

    key = "terraform-workspaces-terragrunt-ansible/${path_relative_to_include()}/terraform.tfstate"
    region         = "ap-southeast-2"
    encrypt        = true
  }
}

inputs = merge(
  local.common_vars.inputs,
)

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "us-east-1"
}
EOF
}