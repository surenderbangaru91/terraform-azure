# LOCALS BLOCK
# Define local variables. 
# These are internal to terraform and reuseble for multiple variables accross the terraform code.
# We can define multiple locals block

locals {
  resource_group_name    = var.resource_group_name
  location               = var.location
  environment            = var.environment
  storage_account_name   = var.storage_account_name
  storage_container_name = var.storage_container_name

  virtual_network = {
    name          = "SBI-VNET"
    address_space = ["10.0.0.0/16"]
  }

  subnet_web = {
    name             = "web-subnet"
    address_prefixes = ["10.0.1.0/24"]
  }

  subnet_app = {
    name             = "app-subnet"
    address_prefixes = ["10.0.2.0/24"]
  }

}
