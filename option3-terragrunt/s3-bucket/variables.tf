variable "prefix" {
  type = string
}

variable "region" {
  type = string
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