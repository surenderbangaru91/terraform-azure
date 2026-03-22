terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.57.0"
    }
  }
  required_version = ">=1.13.5"
}
# Configure the Provider
provider "azurerm" {
  features {

  }
  # Configuration options 
}


resource "azurerm_resource_group" "demorg" {
  name     = "terraform-rg"
  location = "Canada Central"
}


resource "azurerm_storage_account" "stgdemo" {
  name                     = "tfstg0099"
  resource_group_name      = azurerm_resource_group.demorg.name
  location                 = azurerm_resource_group.demorg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "Development"
  }
}

resource "azurerm_storage_container" "stgcon" {
  name                  = "content"
  storage_account_id    = azurerm_storage_account.stgdemo.id
  container_access_type = "private"
}

resource "azurerm_storage_blob" "stgblob" {
  name                   = "my-awesome-content"
  storage_account_name   = azurerm_storage_account.stgdemo.name
  storage_container_name = azurerm_storage_container.stgcon.name
  type                   = "Block"
  #source                 = "AzureDevops.txt"
}