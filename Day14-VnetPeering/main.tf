
resource "azurerm_virtual_network" "vn1" {
  name                = "peered-network-1"
  resource_group_name = azurerm_resource_group.rg1.name
  location            = azurerm_resource_group.rg1.location
  address_space       = ["10.0.0.0/16"]

}

resource "azurerm_subnet" "sn1" {
  name                 = "peered-subnet-1"
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vn1.name
  address_prefixes     = ["10.0.1.0/24"]

}


resource "azurerm_virtual_network" "vn2" {
  name                = "peered-network-2"
  resource_group_name = azurerm_resource_group.rg2.name
  location            = azurerm_resource_group.rg2.location
  address_space       = ["172.16.0.0/16"]
}

resource "azurerm_subnet" "sn2" {
  name                 = "peered-subnet-2"
  resource_group_name  = azurerm_resource_group.rg2.name
  virtual_network_name = azurerm_virtual_network.vn2.name
  address_prefixes     = ["172.16.1.0/24"]

}

resource "azurerm_virtual_network_peering" "v1tov2" {
  name                      = "peer1to2"
  resource_group_name       = azurerm_resource_group.rg1.name
  virtual_network_name      = azurerm_virtual_network.vn1.name
  remote_virtual_network_id = azurerm_virtual_network.vn2.id

  allow_virtual_network_access = true
}

resource "azurerm_virtual_network_peering" "v2tov1" {
  name                      = "peer2to1"
  resource_group_name       = azurerm_resource_group.rg2.name
  virtual_network_name      = azurerm_virtual_network.vn2.name
  remote_virtual_network_id = azurerm_virtual_network.vn1.id

  allow_virtual_network_access = true
}
