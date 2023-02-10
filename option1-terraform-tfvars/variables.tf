variable "region" {
  type    = string
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

variable "allowed_ips_to_s3_bucket" {
  type = list(any)
}

variable "vpc_cidr" {
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

variable "ec2_instance_type" {
  type = string
}

variable "root_volume_size" {
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