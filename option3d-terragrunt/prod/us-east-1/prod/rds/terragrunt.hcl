include "root" {

  path = find_in_parent_folders()
  merge_strategy = "deep"
  expose = "true"
}

include "rds" {

  path = "${dirname(find_in_parent_folders("common_vars.hcl"))}/module_hcls/rds.hcl"
  merge_strategy = "deep"
  expose = "true"
}
