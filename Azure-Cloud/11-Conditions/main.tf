# Create a Resource Group 
resource "azurerm_resource_group" "rg" {
    name     = "RG-${var.system}-${count.index}"
    location = var.location[count.index]
    count    = var.multi-region-deployment ? 3 : 1
    tags = {
        environment = "Terraform Demo"
    }
}
