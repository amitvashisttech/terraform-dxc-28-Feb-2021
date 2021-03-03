# Virtual Machine

resource "azurerm_virtual_machine" "example_rg" {
  count                 = var.my_vm_count
  name                  = "${var.my_rg_name}-vm-${count.index}"
  location              = var.my_loc
  resource_group_name   = var.my_rg_name
  network_interface_ids = [element(var.my_nic_id, count.index)]
  vm_size               = var.vm_size

  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "myosdisk-${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = lookup(var.managed_disk_type, var.my_loc, "Standard_LRS")
  }
  os_profile {
    computer_name  = "example-vm"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    environment = "staging"
  }
}

#output "pip" {
# value = azurerm_public_ip.examplepublicip
#}

#output "my_vm_public_IP" {
# value = azurerm_public_ip.examplepublicip.*.ip_address
#}
