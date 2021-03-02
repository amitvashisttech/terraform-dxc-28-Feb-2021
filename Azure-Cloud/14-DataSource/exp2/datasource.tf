# Get Resources from a Resource Group
#data "azurerm_resources" "example" {
#  resource_group_name = "${var.my_rg_name}-resources-RG"
#}

data "azurerm_resources" "networkinterface" {
  resource_group_name = "${var.my_rg_name}-resources-RG"
  type = "Microsoft.Network/networkInterfaces"
  depends_on = [azurerm_network_interface.example_rg, azurerm_public_ip.examplepublicip ]
}


data "azurerm_resources" "publicinterface" {
  resource_group_name = "${var.my_rg_name}-resources-RG"
  depends_on = [azurerm_network_interface.example_rg, azurerm_public_ip.examplepublicip ]
  type = "Microsoft.Network/publicIPAddresses"
}



#output "resourcedetails" { 
#  value = data.azurerm_resources.example
#}


#output "networkinterface" { 
#  value = data.azurerm_resources.networkinterface.resources.*.name
#}



#output "networkinterface2" { 
# value = data.azurerm_resources.vmname.resources.*.name
#}
