resource "azurerm_resource_group" "rg_front" {
    name     = "Frontend-RG-${var.system}"
    location = var.location

   lifecycle { 
     create_before_destroy = true
   }

    tags = {
        environment = "Terraform Demo"
    }
}



resource "azurerm_resource_group" "rg_back" {
    name     = "Backend-RG-${var.system}"
    location = var.location

   lifecycle { 
     prevent_destroy = false
   }

    tags = {
        environment = "Terraform Demo"
    }
}
