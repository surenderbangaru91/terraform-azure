resource "azurerm_public_ip" "nat_ip" {
  name                = "${local.name_prefix}-nat-ip"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = ["1"]


}

resource "azurerm_nat_gateway" "ngw" {
  name                    = "app-ngw-1"
  location                = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_resource_group.rg.name
  sku_name                = "Standard"
  idle_timeout_in_minutes = 10
  zones                   = ["1"]

}
