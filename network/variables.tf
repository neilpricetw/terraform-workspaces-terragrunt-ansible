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