locals {
  configuration = terraform.workspace == var.base_workspace ? var.configuration[var.base_workspace] : merge(var.configuration[var.base_workspace], lookup(var.configuration, terraform.workspace, {}))

  environment       = local.configuration["environment"]
  environment_owner = local.configuration["environment_owner"]

  // Network
  vpc_cidr     = local.configuration["vpc_cidr"]
  subnet1_cidr = local.configuration["subnet1_cidr"]
  subnet2_cidr = local.configuration["subnet2_cidr"]
  subnet3_cidr = local.configuration["subnet3_cidr"]
  subnet4_cidr = local.configuration["subnet4_cidr"]

  allowed_ips_to_s3_bucket = local.configuration["allowed_ips_to_s3_bucket"]

  # EC2
  ec2_instance_type = local.configuration["ec2_instance_type"]
  root_volume_size  = local.configuration["root_volume_size"]

  # RDS
  db_instance_class = local.configuration["db_instance_class"]
  db_name           = local.configuration["db_name"]
  db_user           = local.configuration["db_user"]
}