# Output Block
output "storage_account_name" {
  description = "storage account name is"
  value       = azurerm_storage_account.stgdemo.id
}