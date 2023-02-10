variable "region" { 
    type = string 
    default = "us-east-1"
}

variable "prefix" {
    type = string
  default = "terraform-workspaces-terragrunt-ansible-comparison"
}

variable "tech_owner" {
    type = string
  default = "neil.price@thoughtworks.com.au"
}

variable "base_workspace" {
  description = "Workspace config to use as a base for all other workspaces"
  type = string
  default = "prod"
}

variable "configuration" {
  type = any
}
