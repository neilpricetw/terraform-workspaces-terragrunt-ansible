locals {
    common_tags = {
        Name = var.prefix
        Environment = var.environment
        EnvironmentOwner = var.environment_owner        
        TechOwner = var.tech_owner        
    } 
}