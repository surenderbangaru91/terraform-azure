# Output Block
output "storage_account_name" {
  description = "storage account name is"
  value       = azurerm_storage_account.stgdemo.id
}


output "nic_private_ip" {
  value = azurerm_network_interface.nic-main.private_ip_address
}