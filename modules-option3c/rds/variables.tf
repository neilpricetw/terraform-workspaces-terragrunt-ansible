variable "prefix" {
  type = string
}

variable "region" {
  type = string
}

variable "tech_owner" { 
    type = string 
}

variable "environment_owner" { 
    type = string 
}

variable "db_instance_class" { 
    type = string 
}

variable "db_name" { 
    type = string 
}

variable "db_user" {
    type = string 
}

variable "vpc_cidr" {
    type = string 
}

variable "vpc_id" { 
    type = string 
}

variable "subnet_private_1_id" { 
    type = string 
}

variable "subnet_private_2_id" { 
    type = string 
}