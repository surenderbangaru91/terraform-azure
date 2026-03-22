output "public_ip_address" {
  value = azurerm_public_ip.lbip.ip_address
}

output "vmss_id" {
  value = azurerm_linux_virtual_machine_scale_set.azvmss.id
}
