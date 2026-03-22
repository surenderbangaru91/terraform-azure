// This is about data block of resoure group
data "azurerm_resource_group" "dt-rg" {
  name = "datasource-rg"

}

// This is about data block of virtual network
data "azurerm_virtual_network" "datanet" {
  name                = "shared-vnet"
  resource_group_name = data.azurerm_resource_group.dt-rg.name
}

// This is about data block of subnet
data "azurerm_subnet" "datasubnet" {
  name                 = "subnet-1"
  virtual_network_name = data.azurerm_virtual_network.datanet.name
  resource_group_name  = data.azurerm_resource_group.dt-rg.name
}