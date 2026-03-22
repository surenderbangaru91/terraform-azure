

// This is output block to print the value of virtual network id
output "virtual_network_id" {
  value = data.azurerm_virtual_network.datanet.id
}

output "subnet_id" {
  value = data.azurerm_subnet.datasubnet.id
}

output "resource_group" {
  value = data.azurerm_resource_group.dt-rg.id
}