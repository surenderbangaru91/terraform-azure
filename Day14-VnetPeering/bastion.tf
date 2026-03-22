
// Azure Bastion Subnet 
resource "azurerm_subnet" "snbast" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.rg1.name
  virtual_network_name = azurerm_virtual_network.vn1.name
  address_prefixes     = ["10.0.10.0/27"]
}

resource "azurerm_public_ip" "bs_pip" {
  name                = "bastion_pub_ip"
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "azbast" {
  name                = "azurebastion"
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.snbast.id
    public_ip_address_id = azurerm_public_ip.bs_pip.id
  }
}