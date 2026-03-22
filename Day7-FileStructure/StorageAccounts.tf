# Storage Account and Container and Blobs

resource "azurerm_storage_account" "stgdemo" {
  name                     = "tfstg0099"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = var.environment
  }
}

resource "azurerm_storage_container" "stgcon" {
  name                  = "content"
  storage_account_id    = azurerm_storage_account.stgdemo.id
  container_access_type = "blob"
}

resource "azurerm_storage_blob" "stgblob" {
  name                   = "my-awesome-content"
  storage_account_name   = azurerm_storage_account.stgdemo.name
  storage_container_name = azurerm_storage_container.stgcon.name
  type                   = "Block"
  source                 = "AzureDevops.txt"
}
