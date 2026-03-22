# Storage Account and Container and Blobs

resource "azurerm_storage_account" "stgdemo" {

  //count = length(local.storage_account)
  for_each = local.storage_account

  name                     = each.value.storage_account_name
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
  for_each = local.storage_account

  name                  = each.value.container_name
  storage_account_id    = azurerm_storage_account.stgdemo[each.key].id
  container_access_type = "blob"

  depends_on = [azurerm_storage_account.stgdemo]
}

resource "azurerm_storage_blob" "stgblob" {
  for_each = local.storage_account

  name                   = each.value.blob_name
  storage_account_name   = azurerm_storage_account.stgdemo[each.key].name
  storage_container_name = azurerm_storage_container.stgcon[each.key].name
  type                   = "Block"
  source                 = each.value.blob_source

  depends_on = [azurerm_storage_container.stgcon]
}
