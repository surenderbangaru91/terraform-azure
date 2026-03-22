terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }

  # Backend Statefile Storage Account
  # This State file maintains the current state of the infrastructure. It is secured in remoteback and applied locked to avoid concurrent execution.

  backend "azurerm" {
    resource_group_name  = "tfstatebck-rg"
    storage_account_name = "aztfstate001299"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
  required_version = ">=1.13.5"
}

# Configure the Provider

provider "azurerm" {
  features {}

}



variable "environment" {
  type        = string
  description = "the env type"
  default     = "staging"

}

# LOCALS BLOCK
# Define local variables. 
# These are internal to terraform and reuseble for multiple variables accross the terraform code.
# We can define multiple locals block

locals {
  resource_group_name = "terraform-rg"
  location            = "Canada Central"
}

#   Resource Block user to create resources in terraform
resource "azurerm_resource_group" "demorg" {
  name     = local.resource_group_name
  location = local.location

}


resource "azurerm_storage_account" "stgdemo" {
  name                     = "tfstg0099"
  resource_group_name      = azurerm_resource_group.demorg.name
  location                 = azurerm_resource_group.demorg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = var.environment
  }
}

resource "azurerm_storage_container" "stgcon" {
  name                  = "content"
  storage_account_id    = azurerm_storage_account.stgdemo.id
  container_access_type = "blob"
}

resource "azurerm_storage_blob" "stgblob" {
  name                   = "my-awesome-content"
  storage_account_name   = azurerm_storage_account.stgdemo.name
  storage_container_name = azurerm_storage_container.stgcon.name
  type                   = "Block"
  source                 = "AzureDevops.txt"
}

# Output Block
output "storage_account_name" {
  description = "storage account name is"
  value       = azurerm_storage_account.stgdemo.id
}