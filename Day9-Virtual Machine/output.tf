# Output Block
output "storage_account_name" {
  description = "storage account name is"
  value       = azurerm_storage_account.stgdemo.id
}


output "nic_private_ip" {
  description = "The private nic address of the resource"
  value = azurerm_network_interface.nic-main.private_ip_address
}

output "public_ip" {
  description = "The public IP address of the resource"
  value       = azurerm_public_ip.pubip.ip_address
}