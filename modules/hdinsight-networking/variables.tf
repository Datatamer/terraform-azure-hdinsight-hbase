variable "resource_group_name" {
  type = string
  description = "Name of the resource group"
}

variable "vnet_name" {
  type = string
  description = "Name of the Virtual Network"
}

variable "subnet_name" {
  type = string
  description = "Name of the subnet"
}

variable "address_prefixes" {
  type = list(string)
  description = "List of cidr blocks for address prefixes"
  default = []
}

variable "additional_service_endpoints" {
  type = list(string)
  description = "List of additional service endpoints"
  default = ["Microsoft.Storage"]
}
