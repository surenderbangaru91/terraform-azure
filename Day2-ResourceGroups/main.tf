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