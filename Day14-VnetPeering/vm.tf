# Network Interfaces (one per VM, attached to the correct subnet)
resource "azurerm_network_interface" "nic_vm1" {
  name                = "nic-vm1"
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.sn1.id
    private_ip_address_allocation = "Dynamic"
    # No public IP – access via Bastion
  }
}

resource "azurerm_network_interface" "nic_vm2" {
  name                = "nic-vm2"
  location            = azurerm_resource_group.rg2.location
  resource_group_name = azurerm_resource_group.rg2.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.sn2.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Windows Virtual Machines
resource "azurerm_windows_virtual_machine" "vm1" {
  name                  = "vm1"
  resource_group_name   = azurerm_resource_group.rg1.name
  location              = azurerm_resource_group.rg1.location # Canada Central
  size                  = "Standard_D2s_v3"
  admin_username        = "adminuser"
  admin_password        = "YourStrongPassword123!" # Change to a secure password
  network_interface_ids = [azurerm_network_interface.nic_vm1.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_windows_virtual_machine" "vm2" {
  name                  = "vm2"
  resource_group_name   = azurerm_resource_group.rg2.name
  location              = azurerm_resource_group.rg2.location # West Europe
  size                  = "Standard_D2s_v3"
  admin_username        = "adminuser"
  admin_password        = "YourStrongPassword123!" # Use a different password if desired
  network_interface_ids = [azurerm_network_interface.nic_vm2.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}