resource "azurerm_resource_group" "rg1" {
  name     = "peeredvnet1-rg"
  location = "Canada Central"

}

resource "azurerm_resource_group" "rg2" {
  name     = "peeredvnet2-rg"
  location = "West Europe"
}
