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

variable "vnet_id" {
  description = "Id of the virtual network in which to deploy HBase resources"
  type        = string
}

variable "network_resource_group" {
  description = "Resource group which owns the VNet"
  type        = string
}

variable "subnet_id" {
  type        = string
  description = "Id of the subnet"
}

variable "worker_count" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "storage_container_id" {
  type        = string
  description = "Id of the storage container"
}

variable "storage_account_primary_access_key" {
  type        = string
  description = "Primary access key of the storage account"
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

variable "module_depends_on" {
  type        = any
  description = "Variable to make sure some other resources get created before the module execution"
  default     = null
}
