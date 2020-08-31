variable "hbase_storage_account_name" {
  type        = string
  description = "Name if the HDInsight hbase storage account"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group where the azure storage account will be created"
}

variable "location" {
  type        = string
  description = "Location of the Azure region"
}

variable "virtual_network_subnet_id" {
  type        = string
  description = "Subnet ID for the storage account in the virtual network"
}

variable "storage_container_name" {
  type        = string
  description = "Name of the container in the storage account"
}

variable "storage_account_kind" {
  description = "Type of storage account. Options are BlobStorage, BlockBlogStorage, FileStorage, Storage, StorageV2"
  type        = string
  default     = "StorageV2"
}

variable "storage_account_tier" {
  description = "Account tier of the storage account. Options are Standard and Premium"
  type        = string
  default     = "Standard"
}

variable "storage_account_access_tier" {
  type        = string
  description = "Access tier of the storage account. Options are Hot and Cool"
  default     = "Hot"
}

variable "storage_account_replication_type" {
  type        = string
  description = "Replication type of the storage account. Options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS"
  default     = "ZRS"
}

variable "enable_https_traffic_only" {
  type        = bool
  description = "Force https traffic only boolean flag"
  default     = true
}

variable "network_rules_default_action" {
  type        = string
  description = "Default action for the network rules. Options are Allow or Deny"
  default     = "Deny"
}

variable "ip_rules" {
  description = "List of IPs explicitly allowed to access UI"
  type        = list(string)
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Map of tags to attach to HBase cluster and storage account"
  default     = {}
}

variable "storage_container_access_type" {
  type        = string
  description = "Access type of the storage container. Options blob, container or private"
  default     = "private"
}

variable "module_depends_on" {
  type        = list(any)
  description = "Variable to make sure some other resources get created before the module execution"
  default     = null
}
