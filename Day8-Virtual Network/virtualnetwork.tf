# Virtual Network
resource "azurerm_virtual_network" "vnet-main" {
  name                = local.virtual_network.name
  address_space       = local.virtual_network.address_space
  location            = var.location
  resource_group_name = var.resource_group_name

  depends_on = [azurerm_resource_group.demorg]
}

resource "azurerm_subnet" "sn-web" {
  name                 = local.subnet_web.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = local.virtual_network.name
  address_prefixes     = local.subnet_web.address_prefixes

  depends_on = [azurerm_virtual_network.vnet-main]
}

resource "azurerm_subnet" "sn-app" {
  name                 = local.subnet_app.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = local.virtual_network.name
  address_prefixes     = local.subnet_app.address_prefixes

  depends_on = [azurerm_virtual_network.vnet-main]
}

resource "azurerm_network_interface" "nic-main" {
  name                = "${var.network_interface}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.sn-web.id
    private_ip_address_allocation = "Dynamic"
  }
}