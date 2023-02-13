module "network" {
    source              = "./network"

    vpc_cidr            = var.vpc_cidr
    subnet1_cidr        = var.subnet1_cidr
    subnet2_cidr        = var.subnet2_cidr
    subnet3_cidr        = var.subnet3_cidr
    subnet4_cidr        = var.subnet4_cidr
    prefix              = var.prefix
    region              = var.region
    environment_owner   = var.environment_owner
    tech_owner          = var.tech_owner
}

module "s3_bucket" {
    source              = "./s3_bucket"

    prefix              = var.prefix
    region              = var.region
    environment_owner   = var.environment_owner
    tech_owner          = var.tech_owner
    allowed_ips         = var.allowed_ips
}

module "rds" {
    source              = "./rds"

    prefix              = var.prefix
    region              = var.region
    environment_owner   = var.environment_owner
    tech_owner          = var.tech_owner
    db_instance_class   = var.db_instance_class
    db_name             = var.db_name
    db_user             = var.db_user
    vpc_cidr            = var.vpc_cidr
    vpc_id              = module.network.vpc_id
    subnet_private_1_id = module.network.subnet_private_1_id
    subnet_private_2_id = module.network.subnet_private_2_id
}

module "ec2_instance" {
    source              = "./ec2_instance"

    prefix              = var.prefix
    region              = var.region
    environment_owner   = var.environment_owner
    tech_owner          = var.tech_owner

    // EC2
    ec2_instance_type   = var.ec2_instance_type
    root_volume_size    = var.root_volume_size
    vpc_id              = module.network.vpc_id
    subnet_public_1_id = module.network.subnet_public_1_id
    s3_bucket_name      = module.s3_bucket.bucket_name
}
