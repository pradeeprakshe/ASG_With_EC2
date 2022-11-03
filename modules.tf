# This module implements our naming standards for components in AWS.
# It requires the parameters below and provides standardized outputs for many aws resource types.
# Is not pinned to any version or tag. Will grab the latest code in main/master branch.
module "naming" {
  source = "git::https://git.tmaws.io/AWS/terraform-module-naming.git"

  product_code_tag   = var.product_code_tag
  environment_tag    = var.environment_tag
  inventory_code_tag = var.inventory_code_tag
  product_name       = var.product_name
  account_tag        = var.account_tag
  aws_region         = var.aws_region
}
