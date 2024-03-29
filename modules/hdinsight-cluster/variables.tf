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

variable "subnet_id" {
  description = "ID of the subnet in which to deploy HDInsight HBase resources"
  type        = string
}

variable "vnet_id" {
  description = "ID of the virtual network in which to deploy HBase resources"
  type        = string
}

variable "worker_count" {
  description = "Desired number of worker nodes"
  type        = number
}

variable "username" {
  description = "Username for ssh access to the instances of the cluster"
  type        = string
  default     = "sshuser"
}

variable "ssh_public_key" {
  description = "SSH public key data"
  type        = string
}

variable "head_node_vm_size" {
  description = "Head node vm size"
  type        = string
  default     = "Standard_D12_V2"
}

variable "worker_node_vm_size" {
  description = "Worker nodes vm size"
  type        = string
  default     = "Standard_D12_V2"
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

variable "hdinsight_cluster_version" {
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
  description = "The cluster tier. Options are Standard or Premium"
  default     = "Standard"
}

variable "hbase_version" {
  type        = string
  description = "Version of hbase"
  default     = "1.1"
}

variable "storage_account_id" {
  type        = string
  description = "ID of the storage account containing ADLS Gen2 instance"
}

variable "managed_identity_resource_id" {
  type        = string
  description = "ID of the managed identity used to access the backing storage account"
}

variable "storage_container_id" {
  type        = string
  description = "ID of the ADLS Gen2 storage container"
}

variable "scaling_days" {
  description = "The days of the week to perform scaling operation. Full names expected (Monday, Tuesday, etc.)"
  type        = list(string)
  default     = []
}

variable "scaling_schedule" {
  description = <<EOF
  Scheduled scaling operations. Expects a map of time at which to scale mapped to workers to scale to. 24 hour hh:mm format expected.
  Example: {"15:00" : 5, "16:00" : 6}
  EOF
  type        = map(string)
  default     = {}
}

variable "scaling_timezone" {
  description = <<EOF
  Timezone in which scaling times are defined. Time Zone ID expected. List of supported Azure Time Zone IDs found here:
  https://docs.microsoft.com/en-us/azure/azure-sql/managed-instance/timezones-overview#list-of-supported-time-zones
  EOF
  type        = string
  default     = ""
}
