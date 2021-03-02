variable "location" {
  type = list 
  description = "Azure location for my RG"
  default = ["eastus", "westus", "westus2"]
}

variable "system" { 
  default = "test"
}

variable "multi-region-deployment" {
   default = false 
}
