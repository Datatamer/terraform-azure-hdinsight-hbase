variable "resource_group_name" {
  type        = string
  description = "Name of the resource group to add the network resources to"
}

variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network"
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
}

variable "address_prefixes" {
  type        = list(string)
  description = "List of cidr blocks for address prefixes"
  default     = []
}

variable "additional_service_endpoints" {
  type        = list(string)
  description = "List of additional service endpoints"
  default     = ["Microsoft.Storage"]
}

variable "nsg_name" {
  description = "Name for the network security group"
  type        = string
}

variable "location" {
  type        = string
  description = "Location of the Azure region"
}

variable "tags" {
  type        = map(string)
  description = "Map of tags to attach to the security group"
  default     = {}
}
