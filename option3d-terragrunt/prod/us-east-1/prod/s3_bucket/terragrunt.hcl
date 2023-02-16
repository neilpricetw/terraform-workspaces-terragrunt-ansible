include "root" {

  path = find_in_parent_folders()
  merge_strategy = "deep"
  expose = "true"
}

include "s3_bucket" {

  path = "${dirname(find_in_parent_folders("common_vars.hcl"))}/module_hcls/s3_bucket.hcl"
  merge_strategy = "deep"
  expose = "true"
}
