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

  features {}
  # Configuration options 
}
