# Create a resource group
resource "azurerm_resource_group" "example_rg" {
  name     = "${var.my_rg_name}-resources-RG"
  location = var.my_loc
 
  tags = {
    Owner = "AV"
   }
}

# Network Configuation
resource "azurerm_virtual_network" "example_rg" {
  name                = "${var.my_rg_name}-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example_rg.location
  resource_group_name = azurerm_resource_group.example_rg.name
}

resource "azurerm_subnet" "internal" {
  name                 = "${var.my_rg_name}-internal"
  resource_group_name  = azurerm_resource_group.example_rg.name
  virtual_network_name = azurerm_virtual_network.example_rg.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "example_rg" {
  name                = "${var.my_rg_name}-nic"
  location            = azurerm_resource_group.example_rg.location
  resource_group_name = azurerm_resource_group.example_rg.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.examplepublicip.id
  }
}

# Public IP Configuration 

resource "azurerm_public_ip" "examplepublicip" {
    name                         = "myPublicIP"
    location                     = "eastus"
    resource_group_name          = azurerm_resource_group.example_rg.name
    allocation_method            = "Dynamic"
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "examplensg" {
    name                = "${var.my_rg_name}-nsg"
    location            = "eastus"
    resource_group_name = azurerm_resource_group.example_rg.name

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

#    tags = {
#        environment = "Terraform Demo"
#    }
}

# Virtual Machine

resource "azurerm_virtual_machine" "example_rg" {
  name                  = "${var.my_rg_name}-vm"
  location              = azurerm_resource_group.example_rg.location
  resource_group_name   = azurerm_resource_group.example_rg.name
  network_interface_ids = [azurerm_network_interface.example_rg.id]
  vm_size               = var.vm_size

 delete_os_disk_on_termination = true
 delete_data_disks_on_termination = true

 storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

 storage_os_disk {
    name              = "myosdisk1"
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


output "pip" {
 value = azurerm_public_ip.examplepublicip
}


output "my_vm_public_IP" {
 value = azurerm_public_ip.examplepublicip.ip_address
}

