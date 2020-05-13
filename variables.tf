variable "resource_group_name" {
    description = "Name of resource group"
    type = string
}

data "azurerm_resource_group" "tamr_rg" {
    name = var.resource_group_name
}

variable "location" {
    type = string
}

variable "cluster_name" {
    description = "Name of HD-Insights HBase cluster"
    type = string
}

variable "storage_container_name" {
    description = "Name of HD-Insights HBase cluster storage container"
    type = string
}

variable "ip_rules" {
    description = "Array of IPs explicitly allowed to access UI"
    type = list(string)
}

variable "subnet_id" {
    description = "Subnet in which to deploy HD-Insights HBase resources"
    type = string
}

variable "vnet_id" {
    description = "Virtual network in which to deploy HBase resources"
    type = string
}

data "azurerm_virtual_network" "selected" {
    resource_group_name = var.existing_network_resource_group
    name = var.vnet_id
}

data "azurerm_subnet" "subnet_selected" {
    resource_group_name = var.existing_network_resource_group
    virtual_network_name = var.vnet_id
    name = var.subnet_id
}

variable "existing_network_resource_group" {
    description = "Resource group which owns the VNet"
    type = string
}

variable "worker_count" {
    description = "Desired number of worker nodes"
    type = number
}

variable "storage_account_kind" {
    description = "Account kind"
    type = string
    default = "StorageV2"
}

variable "storage_account_tier" {
    description = "Account tier"
    type = string
    default = "Standard"
}

variable "storage_account_replication_type" {
    description = "Account replication type"
    type = string
    default = "ZRS"
}

variable "username" {
    description = "Username"
    type = string
    default = "sshuser"
}

variable "ssh_key" {
    description = "SSH key"
    type = string
}

variable "head_node_vm_size" {
    description = "Head node vm size"
    type = string
    default = "Standard_D3_V2"
}

variable "worker_node_vm_size" {
    description = "Worker nodes vm size"
    type = string
    default = "Standard_D3_V2"
}

variable "zk_node_vm_size" {
    description = "Zookeeper nodes vm size"
    type = string
    default = "Standard_A4_v2"
}

variable "gateway_username" {
    description = "Gateway username"
    type = string
    default = "admin"
}

variable "gateway_password" {
    description = "Gateway password"
    type = string
}

variable "hbase_storage_name" {
    description = "Name of HBase storage account"
    type = string
}

variable "enable_advanced_threat_protection" {
    description = "Enable advanced threat protection"
    type = bool
    default = false
}

variable "hdinsights_cluster_version" {
    description = "Version for HDInsights cluster"
    type = string
    default = "3.6"
}

variable "tags" {
    type = map(string)
    description = "Map of tags to attach to HBase cluster and storage account"
    default = {}
}
