resource "azurerm_virtual_network" "vn" {
  name                = local.network_config.vnet_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = var.address_space

}

resource "azurerm_subnet" "appsn" {
  name                 = local.network_config.app_subnet_name
  virtual_network_name = azurerm_virtual_network.vn.name
  resource_group_name  = azurerm_resource_group.rg.name
  address_prefixes     = var.app_subnet

}

resource "azurerm_subnet" "mgsn" {
  name                 = local.network_config.mgmt_subnet_name
  virtual_network_name = azurerm_virtual_network.vn.name
  resource_group_name  = azurerm_resource_group.rg.name
  address_prefixes     = var.mgmt_subnet

}

resource "azurerm_subnet_nat_gateway_association" "snngw" {
  subnet_id      = azurerm_subnet.appsn.id
  nat_gateway_id = azurerm_nat_gateway.ngw.id
}

