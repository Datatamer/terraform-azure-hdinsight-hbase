variable "resource_group_name" {
  description = "Name of resource group"
  type        = string
}

variable "location" {
  type        = string
  description = "Azure region where the HDInsight HBase cluster is to be deployed"
}

variable "cluster_name" {
  description = "Name of HDInsight HBase cluster"
  type        = string
}

variable "storage_container_name" {
  description = "Name of HDInsight HBase cluster storage container"
  type        = string
}

variable "ip_rules" {
  description = "Array of IPs explicitly allowed to access UI"
  type        = list(string)
}

variable "subnet_id" {
  description = "ID of the subnet in which to deploy HDInsight HBase resources"
  type        = string
}

variable "vnet_id" {
  description = "ID of the virtual network in which to deploy HBase resources"
  type        = string
}

variable "existing_network_resource_group" {
  description = "Resource group which owns the VNet"
  type        = string
}

variable "worker_count" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "storage_account_kind" {
  description = "Account kind"
  type        = string
  default     = "StorageV2"
}

variable "storage_account_tier" {
  description = "Account tier"
  type        = string
  default     = "Standard"
}

variable "storage_account_replication_type" {
  description = "Account replication type"
  type        = string
  default     = "ZRS"
}

variable "username" {
  description = "Username"
  type        = string
  default     = "sshuser"
}

variable "path_to_ssh_key" {
  description = "Path to the SSH key"
  type        = string
}

variable "head_node_vm_size" {
  description = "Head node vm size"
  type        = string
  default     = "Standard_D3_V2"
}

variable "worker_node_vm_size" {
  description = "Worker nodes vm size"
  type        = string
  default     = "Standard_D3_V2"
}

variable "zk_node_vm_size" {
  description = "Zookeeper nodes vm size"
  type        = string
  default     = "Standard_A4_v2"
}

variable "gateway_username" {
  description = "Gateway username"
  type        = string
  default     = "admin"
}

variable "gateway_password" {
  description = "Gateway password"
  type        = string
}

variable "hbase_storage_name" {
  description = "Name of HBase storage account"
  type        = string
}

variable "enable_advanced_threat_protection" {
  description = "Enable advanced threat protection"
  type        = bool
  default     = false
}

variable "hdinsights_cluster_version" {
  description = "Version for HDInsight cluster"
  type        = string
  default     = "3.6"
}

variable "tags" {
  type        = map(string)
  description = "Map of tags to attach to HBase cluster and storage account"
  default     = {}
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

variable "storage_account_access_tier" {
  type        = string
  description = "Access tier of the storage account. Options are Hot and Cool"
  default     = "Hot"
}

variable "storage_container_access_type" {
  type        = string
  description = "Access type of the storage container. Options blob, container or private"
  default     = "private"
}

variable "cluster_tier" {
  type        = string
  description = "The cluster tier. Optionas are Standard or Premium"
  default     = "Standard"
}

variable "hbase_version" {
  type        = string
  description = "Version of hbase"
  default     = "1.1"
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

variable "public_nsg_name" {
    type = string
    description = "Name of the public network security group"
}

variable "private_nsg_name" {
    type = string
    description = "Name of the private network security group"
}
