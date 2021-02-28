provider "azurerm" {
  features {}
}


# Create a resource group
resource "azurerm_resource_group" "example_rg" {
  name     = "example-resources-RG"
  location = "eastus"
 
  tags = {
    Owner = "AV"
   }
}
