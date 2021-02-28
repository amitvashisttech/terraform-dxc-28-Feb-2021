provider "azurerm" {
  subscription_id = "xxxxxxxxxxxxxxxxxxxxxx"
  client_id = "xxxxxxxxxxxxxxxxxxxxxx"
  client_secret = "xxxxxxxxxxxxxxxxxxxxxx"
  tenant_id = "xxxxxxxxxxxxxxxxxxxxxx"

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
