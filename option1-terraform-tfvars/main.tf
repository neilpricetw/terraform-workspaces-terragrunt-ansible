module "network" { 
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

module "s3_bucket" {
    source              = "../modules/s3-bucket"

    prefix              = var.prefix
    region              = var.region
    environment         = var.environment
    environment_owner   = var.environment_owner        
    tech_owner          = var.tech_owner   
    allowed_ips         = var.allowed_ips

    providers = {
        aws = aws.us-east-1
    }
}