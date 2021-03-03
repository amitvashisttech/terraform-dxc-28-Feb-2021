variable "my_loc" {
  description = "My Resource Location"
  default = "eastus"
}

variable "my_vm_count" {
  default = 1
}

variable "my_rg_name" {
  description = "My Resource Group Name"
  default     = "TestRG"
}

variable "admin_username" {
  type        = string
  description = "Administrator username for server"
  default     = "amitvashist7"
}

variable "admin_password" {
  type        = string
  description = "Administrator password for server"
  default     = "Password@123456789"
}

variable "managed_disk_type" {
  type        = map
  description = "Disk type Premium in Primary location Standard in DR location"

  default = {
    westus = "Premium_LRS"
    eastus = "Standard_LRS"
  }
}

variable "vm_size" {
  type        = string
  description = "Size of VM"
  default     = "Standard_B1s"
}


variable "my_nic_id" {}
