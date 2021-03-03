# Create a resource group
resource "azurerm_resource_group" "example_rg" {
  name     = var.my_rg_name
  location = var.my_loc

  tags = {
    Owner = "AV"
  }
}

# Network Configuation
resource "azurerm_virtual_network" "example_rg" {
  name                = "${var.my_rg_name}-network"
  address_space       = var.my_vpc_cidr
  location            = var.my_loc
  resource_group_name = azurerm_resource_group.example_rg.name
}

resource "azurerm_subnet" "internal" {
  name                 = "${var.my_rg_name}-internal"
  resource_group_name  = azurerm_resource_group.example_rg.name
  virtual_network_name = azurerm_virtual_network.example_rg.name
  address_prefixes     = var.my_vpc_subnet_cidr
}

resource "azurerm_network_interface" "my_nic" {
  count               = var.my_vm_count
  name                = "${var.my_rg_name}-nic-${count.index}"
  location            = var.my_loc
  resource_group_name = azurerm_resource_group.example_rg.name

  ip_configuration {
    name                          = "testconfiguration1-${count.index}"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.examplepublicip.*.id, count.index)
  }
}

# Public IP Configuration
#
resource "azurerm_public_ip" "examplepublicip" {
  count               = var.my_vm_count
  name                = "myPublicIP-${count.index}"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.example_rg.name
  allocation_method   = "Dynamic"
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "examplensg" {
  name                = "${var.my_rg_name}-nsg"
  location            = "eastus"
  resource_group_name = azurerm_resource_group.example_rg.name
}

resource "azurerm_network_security_rule" "testrules" {
    count = length(var.inbound_ports)
    name                       = "Allowed_Port${count.index}"
    priority                   = "10${count.index}"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = element(var.inbound_ports, count.index)
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    resource_group_name        = azurerm_resource_group.example_rg.name
    network_security_group_name     = azurerm_network_security_group.examplensg.name
  }
