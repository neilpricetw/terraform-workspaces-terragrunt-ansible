variable "ec2_instance_type" {
    type = string
}

variable "root_volume_size" {
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

variable "prefix" {
  type = string
}

variable "region" {
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
    default = []
}