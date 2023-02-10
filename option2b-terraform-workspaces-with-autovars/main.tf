module "network_us_east_1" { 
    source              = "../modules/network"

    vpc_cidr            = local.vpc_cidr
    subnet1_cidr        = local.subnet1_cidr
    subnet2_cidr        = local.subnet2_cidr
    subnet3_cidr        = local.subnet3_cidr
    subnet4_cidr        = local.subnet4_cidr
    prefix              = var.prefix
    region              = var.region
    environment         = local.environment
    environment_owner   = local.environment_owner
    tech_owner          = var.tech_owner   

    providers = {
        aws = aws.us-east-1
    }
}

module "s3_bucket_us_east_1" {
    source              = "../modules/s3_bucket"

    prefix              = var.prefix
    region              = var.region
    environment         = local.environment
    environment_owner   = local.environment_owner
    tech_owner          = var.tech_owner   
    allowed_ips         = local.allowed_ips_to_s3_bucket

    providers = {
        aws = aws.us-east-1
    }
}

module "rds_us_east_1" {
    source              = "../modules/rds"

    prefix              = var.prefix
    region              = var.region
    environment         = local.environment
    environment_owner   = local.environment_owner
    tech_owner          = var.tech_owner   
    db_instance_class   = local.db_instance_class
    db_name             = local.db_name
    db_user             = local.db_user
    vpc_cidr            = local.vpc_cidr
    vpc_id              = module.network_us_east_1.vpc_id
    subnet_private_1_id = module.network_us_east_1.subnet_private_1_id
    subnet_private_2_id = module.network_us_east_1.subnet_private_2_id

    depends_on = [
        module.network_us_east_1
    ]  

    providers = {
        aws = aws.us-east-1
    }
}

module "ec2_instance_us_east_1" {  
    source                      = "../modules/ec2_instance"

    prefix              = var.prefix
    region              = var.region
    environment         = local.environment
    environment_owner   = local.environment_owner
    tech_owner          = var.tech_owner       

    // EC2
    ec2_instance_type   = local.ec2_instance_type
    root_volume_size    = local.root_volume_size
    vpc_id              = module.network_us_east_1.vpc_id
    subnet_public_1_id  = module.network_us_east_1.subnet_public_1_id        
    s3_bucket_name      = module.s3_bucket_us_east_1.bucket_name
  
    depends_on = [
        module.network_us_east_1,
        module.s3_bucket_us_east_1
    ]  

    providers = {
        aws = aws.us-east-1
    }
}


### DR solution

locals {
    is_dr = local.environment == "DR"
} 

module "network_us_east_2" {
    count               = local.is_dr ? 1 : 0
    source              = "../modules/network"

    vpc_cidr            = local.vpc_cidr
    subnet1_cidr        = local.subnet1_cidr
    subnet2_cidr        = local.subnet2_cidr
    subnet3_cidr        = local.subnet3_cidr
    subnet4_cidr        = local.subnet4_cidr
    prefix              = var.prefix
    region              = var.region
    environment         = local.environment
    environment_owner   = local.environment_owner
    tech_owner          = var.tech_owner   

    providers = {
        aws = aws.us-east-2
    }
}

module "s3_bucket_us_east_2" {
    count               = local.is_dr ? 1 : 0    
    source              = "../modules/s3_bucket"

    prefix              = var.prefix
    region              = var.region
    environment         = local.environment
    environment_owner   = local.environment_owner
    tech_owner          = var.tech_owner   
    allowed_ips         = local.allowed_ips_to_s3_bucket

    providers = {
        aws = aws.us-east-2
    }
}

module "rds_us_east_2" {
    count               = local.is_dr ? 1 : 0    
    source              = "../modules/rds"

    prefix              = var.prefix
    region              = var.region
    environment         = local.environment
    environment_owner   = local.environment_owner
    tech_owner          = var.tech_owner   
    db_instance_class   = local.db_instance_class
    db_name             = local.db_name
    db_user             = local.db_user
    vpc_cidr            = local.vpc_cidr
    vpc_id              = module.network_us_east_1.vpc_id
    subnet_private_1_id = module.network_us_east_1.subnet_private_1_id
    subnet_private_2_id = module.network_us_east_1.subnet_private_2_id
    
    depends_on = [
        module.network_us_east_2
    ]  

    providers = {
        aws = aws.us-east-2
    }
}

module "ec2_instance_us_east_2" {  
    count               = local.is_dr ? 1 : 0    
    source              = "../modules/ec2_instance"

    prefix              = var.prefix
    region              = var.region
    environment         = local.environment
    environment_owner   = local.environment_owner
    tech_owner          = var.tech_owner       

    // EC2
    ec2_instance_type   = local.ec2_instance_type
    root_volume_size    = local.root_volume_size
    vpc_id              = tolist([ for wp in module.network_us_east_2 : wp.vpc_id])[0]
    subnet_public_1_id  = tolist([ for wp in module.network_us_east_2 : wp.subnet_public_1_id])[0]   
    s3_bucket_name      = tolist([ for wp in module.s3_bucket_us_east_2 : wp.bucket_name])[0]
    
    depends_on = [
        module.network_us_east_2,
        module.s3_bucket_us_east_2
    ]  

    providers = {
        aws = aws.us-east-2
    }
}