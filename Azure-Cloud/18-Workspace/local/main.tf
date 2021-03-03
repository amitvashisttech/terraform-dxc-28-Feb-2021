resource "azurerm_resource_group" "myterraformgroup" {
    name     = "${var.my_rg_name}-${terraform.workspace}"
    location = var.my_loc

    tags = {
        environment = "Terraform Demo-${terraform.workspace}"
    }
}
