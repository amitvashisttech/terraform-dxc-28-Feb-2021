output "my_rg_name" {
  value = azurerm_resource_group.example_rg.name
}

output "my_nic" {
  value = azurerm_network_interface.my_nic.*.id
}

output "pub_ips" {
  value = azurerm_public_ip.examplepublicip.*.id
}
