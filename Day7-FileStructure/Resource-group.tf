#   Resource Block user to create resources in terraform
resource "azurerm_resource_group" "demorg" {
  name     = var.resource_group_name
  location = var.location

}