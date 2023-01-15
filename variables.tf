variable "region" { 
    type = string 
    default = "us-east-1"
}

variable "prefix" { 
    type = string 
    default = "terraform-workspaces-terragrunt-ansible-test"
}

variable "tech_owner" { 
    type = string 
    default = "neil.price@thoughtworks.com.au"    
}

variable "environment" { 
    type = string 
}

variable "environment_owner" { 
    type = string 
}

variable "allowed_ips" {
    type = list
}