# Virtual Machines

resource "azurerm_virtual_machine" "main" {
  name                  = "${var.virtual_machine_name}-vm-1"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.nic-main.id]
  vm_size               = "Standard_D2S_v3"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = var.is_os_disk_delete

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
    disk_size_gb      = var.disk_size_gb
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = var.environment
  }
}

resource "azurerm_public_ip" "pubip" {
  name                = "webvm-pub-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  # Use "Static" for a persistent IP, or "Dynamic" (default)
  allocation_method   = "Static"
  sku                 = "Standard" # Standard SKU is recommended for production
}