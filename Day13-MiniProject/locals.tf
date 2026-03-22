locals {
  vm_size = {
    dev  = "Standard_D2s_v3"
    prod = "Standard_D2s_v3"
  }

  name_prefix = "${var.prefix}-${var.environment}"

  vm_name = {
    dev  = "app-vmss"
    prod = "prod-vmss"
  }

  network_config = {
    vnet_name        = "${local.name_prefix}-vnet"
    app_subnet_name  = "app-subnet"
    mgmt_subnet_name = "mgmt-subnet"
  }

  load_balancer = {
    lb_name = "${local.name_prefix}-lb"
  }
}

