terraform {
  backend "azurerm" {
    resource_group_name  = "tfdemo"
    storage_account_name = "tfdemo18443"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
