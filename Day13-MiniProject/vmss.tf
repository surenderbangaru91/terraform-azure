resource "azurerm_linux_virtual_machine_scale_set" "azvmss" {
  name                        = local.vm_name[var.environment]
  resource_group_name         = azurerm_resource_group.rg.name
  location                    = azurerm_resource_group.rg.location
  sku                         = lookup(local.vm_size, var.environment, "Standard_D2s_v3")
  instances                   = var.instance_count
  platform_fault_domain_count = 1

  zones          = ["1"]
  admin_username = "adminuser"
  admin_password = var.admin_passwd

  # This line enables password authentication
  disable_password_authentication = false


  /*admin_ssh_key {
    username   = "adminuser"
    public_key = var.pub_key
  }

   

  # Custom data to enable password SSH
  custom_data = base64encode(<<-EOF
    #!/bin/bash
    sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
    systemctl restart sshd
  EOF
  )*/

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "vmss-nic"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = azurerm_subnet.appsn.id

      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.bckapl.id]

    }
  }
}