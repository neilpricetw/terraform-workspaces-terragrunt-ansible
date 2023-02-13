locals{
  region = get_env("REGION")
  env = get_env("TF_WORKSPACE")
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

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
  provider "aws" {
    region = "${local.region}"
  }
EOF
}

inputs = {
  region = local.region
}

terraform {
  source = "${find_in_parent_folders("modules-option3c")}"


  extra_arguments "vars"{
    commands = [
      "apply",
      "plan",
      "import",
      "push",
      "refresh"
    ]

    optional_var_files = [
      "${find_in_parent_folders("option3c-terragrunt-with-bash-support")}/vars/common_vars.tfvars",
      "${find_in_parent_folders("option3c-terragrunt-with-bash-support")}/vars/${local.env}.tfvars",
    ]
  }
}
