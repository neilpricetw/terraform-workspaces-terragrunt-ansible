resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = "true" 
  enable_dns_hostnames = "true" 
  enable_classiclink   = "false"
  instance_tenancy     = "default"

  tags = local.common_tags
}


resource "aws_subnet" "subnet_public_1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet1_cidr
  map_public_ip_on_launch = "true" 
  availability_zone       = format("%sa", var.region)
  
  tags = {
    Name = format("%s-public-subnet-1", var.prefix)
    Environment = var.environment
    EnvironmentOwner = var.environment_owner        
    TechOwner = var.tech_owner     
  }
}


resource "aws_subnet" "subnet_public_2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet2_cidr
  map_public_ip_on_launch = "true" 
  availability_zone       = format("%sb", var.region)

  tags = {
    Name = format("%s-public-subnet-2", var.prefix)
    Environment = var.environment
    EnvironmentOwner = var.environment_owner        
    TechOwner = var.tech_owner     
  }
}


resource "aws_subnet" "subnet_private_1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet3_cidr
  map_public_ip_on_launch = "false" 
  availability_zone       = format("%sa", var.region)

  tags = {
    Name = format("%s-private-subnet-1", var.prefix)
    Environment = var.environment
    EnvironmentOwner = var.environment_owner        
    TechOwner = var.tech_owner     
  }
}


resource "aws_subnet" "subnet_private_2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.subnet4_cidr
  map_public_ip_on_launch = "false" 
  availability_zone       = format("%sb", var.region)

  tags = {
    Name = format("%s-private-subnet-2", var.prefix)
    Environment = var.environment
    EnvironmentOwner = var.environment_owner        
    TechOwner = var.tech_owner     
  }
}
