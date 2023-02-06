variable "region" { 
    type = string 
    default = "us-east-1"
}

variable "prefix" { 
    type = string 
}

variable "tech_owner" { 
    type = string    
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

variable "VPC_cidr" {
  type = string
}

variable "subnet1_cidr" {
  type = string
}

variable "subnet2_cidr" {
  type = string
}

variable "subnet3_cidr" {
  type = string
}

variable "subnet4_cidr" {
  type = string
}