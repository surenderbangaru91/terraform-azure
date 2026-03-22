# LOCALS BLOCK
# Define local variables. 
# These are internal to terraform and reuseble for multiple variables accross the terraform code.
# We can define multiple locals block

locals {
  resource_group_name = var.resource_group_name
  location            = var.location
  environment         = var.environment
}