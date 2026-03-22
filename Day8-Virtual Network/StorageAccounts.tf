# Storage Account and Container and Blobs

resource "azurerm_storage_account" "stgdemo" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = var.environment
  }

  depends_on = [azurerm_resource_group.demorg]
}

resource "azurerm_storage_container" "stgcon" {
  name                  = var.storage_container_name
  storage_account_id    = azurerm_storage_account.stgdemo.id
  container_access_type = "blob"

  depends_on = [azurerm_storage_account.stgdemo]
}

resource "azurerm_storage_blob" "stgblob" {
  name                   = "my-awesome-content"
  storage_account_name   = var.storage_account_name
  storage_container_name = azurerm_storage_container.stgcon.name
  type                   = "Block"
  source                 = "AzureDevops.txt"

  depends_on = [azurerm_storage_container.stgcon]
}
