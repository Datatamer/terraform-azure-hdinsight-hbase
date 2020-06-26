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

variable "subnet_id" {
  type = string
  description = "Id of the subnet"
}

variable "tags" {
  type = map(string)
  description = "Map of tags to attach to HBase cluster and storage account"
  default = {}
}
