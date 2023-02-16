include "root" {

  path = find_in_parent_folders()
  merge_strategy = "deep"
  expose = "true"
}

include "ec2" {

  path = "${dirname(find_in_parent_folders("common_vars.hcl"))}/module_hcls/ec2.hcl"
  merge_strategy = "deep"
  expose = "true"
}
