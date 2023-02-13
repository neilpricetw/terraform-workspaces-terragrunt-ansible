locals {
    common_tags = {
        Name = var.prefix
        Environment = terraform.workspace
        EnvironmentOwner = var.environment_owner
        TechOwner = var.tech_owner
    }
}
