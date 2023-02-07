module "network_us_east_1" { 
    source              = "../modules/network"

    VPC_cidr            = var.VPC_cidr
    subnet1_cidr        = var.subnet1_cidr
    subnet2_cidr        = var.subnet2_cidr
    subnet3_cidr        = var.subnet3_cidr
    subnet4_cidr        = var.subnet4_cidr
    prefix              = var.prefix
    region              = var.region
    environment         = var.environment
    environment_owner   = var.environment_owner        
    tech_owner          = var.tech_owner   

    providers = {
        aws = aws.us-east-1
    }
}

module "s3_bucket_us_east_1" {
    source              = "../modules/s3-bucket"

    prefix              = var.prefix
    region              = var.region
    environment         = var.environment
    environment_owner   = var.environment_owner        
    tech_owner          = var.tech_owner   
    allowed_ips         = var.allowed_ips_to_s3_bucket

    providers = {
        aws = aws.us-east-1
    }
}

module "rds_us_east_1" {
    source              = "../modules/rds"

    prefix              = var.prefix
    region              = var.region
    environment         = var.environment
    environment_owner   = var.environment_owner        
    tech_owner          = var.tech_owner   
    db_instance_class   = var.db_instance_class
    db_name             = var.db_name
    db_user             = var.db_user
    VPC_cidr            = var.VPC_cidr 

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
    environment         = var.environment
    environment_owner   = var.environment_owner        
    tech_owner          = var.tech_owner       

    // EC2
    ec2_instance_type   = var.ec2_instance_type    
    root_volume_size    = var.root_volume_size  
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
    is_dr = var.environment == "DR"
} 

module "network_us_east_2" {
    count               = local.is_dr ? 1 : 0
    source              = "../modules/network"

    VPC_cidr            = var.VPC_cidr
    subnet1_cidr        = var.subnet1_cidr
    subnet2_cidr        = var.subnet2_cidr
    subnet3_cidr        = var.subnet3_cidr
    subnet4_cidr        = var.subnet4_cidr
    prefix              = var.prefix
    region              = var.region
    environment         = var.environment
    environment_owner   = var.environment_owner        
    tech_owner          = var.tech_owner   

    providers = {
        aws = aws.us-east-2
    }
}

module "s3_bucket_us_east_2" {
    count               = local.is_dr ? 1 : 0    
    source              = "../modules/s3-bucket"

    prefix              = var.prefix
    region              = var.region
    environment         = var.environment
    environment_owner   = var.environment_owner        
    tech_owner          = var.tech_owner   
    allowed_ips         = var.allowed_ips_to_s3_bucket

    providers = {
        aws = aws.us-east-2
    }
}

module "rds_us_east_2" {
    count               = local.is_dr ? 1 : 0    
    source              = "../modules/rds"

    prefix              = var.prefix
    region              = var.region
    environment         = var.environment
    environment_owner   = var.environment_owner        
    tech_owner          = var.tech_owner   
    db_instance_class   = var.db_instance_class
    db_name             = var.db_name
    db_user             = var.db_user
    VPC_cidr            = var.VPC_cidr 

    depends_on = [
        module.network_us_east_2
    ]  

    providers = {
        aws = aws.us-east-2
    }
}

module "ec2_instance_us_east_2" {  
    count               = local.is_dr ? 1 : 0    
    source                      = "../modules/ec2_instance"

    prefix              = var.prefix
    region              = var.region
    environment         = var.environment
    environment_owner   = var.environment_owner        
    tech_owner          = var.tech_owner       

    // EC2
    ec2_instance_type   = var.ec2_instance_type    
    root_volume_size    = var.root_volume_size  
    s3_bucket_name      = tolist([ for wp in module.s3_bucket_us_east_2 : wp.bucket_name])[0]
    
    depends_on = [
        module.network_us_east_2,
        module.s3_bucket_us_east_2
    ]  

    providers = {
        aws = aws.us-east-2
    }
}