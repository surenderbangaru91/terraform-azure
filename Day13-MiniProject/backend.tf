# Backend Statefile Storage Account
# This State file maintains the current state of the infrastructure. It is secured in remoteback and applied locked to avoid concurrent execution.

terraform {
  backend "azurerm" {
    resource_group_name  = "tfstatebck-rg"
    storage_account_name = "aztfstate001299"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}