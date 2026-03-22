
resource "azurerm_public_ip" "lbip" {
  name                = local.name_prefix
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = ["1"]
}

resource "azurerm_lb" "projlb" {
  name                = local.load_balancer.lb_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  frontend_ip_configuration {
    name                          = "PublicIPAddress"
    public_ip_address_id          = azurerm_public_ip.lbip.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_lb_backend_address_pool" "bckapl" {
  loadbalancer_id = azurerm_lb.projlb.id
  name            = "Backendpool"
}

resource "azurerm_lb_probe" "lbhprob" {
  loadbalancer_id     = azurerm_lb.projlb.id
  name                = "ssh-running-probe"
  interval_in_seconds = 5
  number_of_probes    = 2
  port                = 80
  protocol            = "Http"
  request_path        = "/"
}

resource "azurerm_lb_rule" "projlbrule" {
  loadbalancer_id                = azurerm_lb.projlb.id
  name                           = "LBRule"
  protocol                       = "Tcp"
  frontend_port                  = 22
  backend_port                   = 22
  frontend_ip_configuration_name = "PublicIPAddress"

  backend_address_pool_ids = [azurerm_lb_backend_address_pool.bckapl.id]

  probe_id = azurerm_lb_probe.lbhprob.id
}