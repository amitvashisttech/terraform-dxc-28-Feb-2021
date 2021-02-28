provider "azurerm" {
  
  version = ">=2.40,<=2.48"
  features {}
}


# Create a resource group
resource "azurerm_resource_group" "example_rg" {
  name     = "example-resources-RG"
  location = "eastus"
 
  tags = {
    owner = "Amit Vashist"
   }
}
