variable "public_nsg_name" {
  type = string
  description = "Name of the public network security group"
}

variable "private_nsg_name" {
  type = string
  description = "Name of the private network security group"
}

variable "location" {
  type = string
  description = "Azure location where the network security group will be created"
}

variable "resource_group" {
  type = string
  description = "Name of the resource group for the network security group"
}
