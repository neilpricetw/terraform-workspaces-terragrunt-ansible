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

variable "base_workspace" {
  description = "Workspace config to use as a base for all other workspaces"
  type        = string
}

variable "configuration" {
  type = any
}
