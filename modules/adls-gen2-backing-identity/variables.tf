variable "identity_name" {
  description = "Name to assign to service principal"
  type        = string
  default     = "hbasegen2principal"
}

variable "resource_group_name" {
  description = "Name of resource group"
  type        = string
}

variable "location" {
  description = "Location in which to create resources"
  type        = string
}

variable "storage_account_id" {
  description = "ID of storage account the service principal will have access to"
  type        = string
}
