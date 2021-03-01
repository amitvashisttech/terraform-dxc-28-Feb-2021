variable "my_loc" {
  description = "My Resource Location"
}


variable "my_rg_name" {
  description = "My Resource Group Name"
  default     = "TestRG"
}

variable "admin_username" {
    type = string
    description = "Administrator username for server"
}

variable "admin_password" {
    type = string
    description = "Administrator password for server"
}

variable "managed_disk_type" {
    type = map
    description = "Disk type Premium in Primary location Standard in DR location"

    default = {
        westus = "Premium_LRS"
        eastus = "Standard_LRS"
    }
}

variable "vm_size" {
    type = string
    description = "Size of VM"
    default = "Standard_B1s"
}

