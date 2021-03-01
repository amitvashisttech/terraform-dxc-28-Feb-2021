resource "azurerm_resource_group" "rg" {
    name     = "RG-${var.system}"
    location = var.location

   lifecycle { 
     create_before_destroy = true
   }

    tags = {
        environment = "Terraform Demo"
    }
}
