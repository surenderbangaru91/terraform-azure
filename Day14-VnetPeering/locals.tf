locals {
  locations = [
    azurerm_resource_group.rg1.location,
    azurerm_resource_group.rg2.location
  ]

  rg_names = [
    azurerm_resource_group.rg1.name,
    azurerm_resource_group.rg2.name
  ]

  subnet_ids = [
    azurerm_subnet.sn1.id,
    azurerm_subnet.sn2.id
  ]
}