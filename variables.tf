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
  description = "Username for ssh access to the instances of the cluster"
  type        = string
  default     = "sshuser"
}

variable "ssh_public_key" {
  description = "SSH public key"
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

variable "enable_advanced_threat_protection" {
  description = "Enable advanced threat protection"
  type        = bool
  default     = false
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
  description = "The cluster tier. Options are Standard or Premium"
  default     = "Standard"
}

variable "hbase_version" {
  type        = string
  description = "Version of hbase"
  default     = "1.1"
}

variable "destination_address" {
  type        = string
  description = <<EOF
  CIDR or destination IP range or * to match any IP.
  Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used."
  EOF
}

variable "private_traffic_ports" {
  description = <<EOF
  Destination ports to create network rules for. See non-public ports:
  https://docs.microsoft.com/en-us/azure/hdinsight/hdinsight-hadoop-port-settings-for-services#non-public-ports
  EOF
  type        = list(number)
  default = [
    8080,  // Ambari web UI + REST API
    16000, // HMaster
    16010, // HMaster info Web UI
    16020, // Region server
    2181,  // The port that clients use to connect to ZooKeeper
  ]
}

variable "public_traffic_ports" {
  description = <<EOF
  Destination ports to create network rules for. See public ports:
  https://docs.microsoft.com/en-us/azure/hdinsight/hdinsight-hadoop-port-settings-for-services#public-ports
  EOF
  type        = list(number)
  default = [
    22,  // sshd connection to primary headnode and edgenode
    23,  // sshd connection to the secondary headnode
    443, // https connections for UIs and APIs
  ]

}

variable "private_traffic_address_prefixes" {
  type        = list(string)
  description = "List of source address prefixes for private traffic. Tags may not be used."
}

variable "public_traffic_address_prefixes" {
  type        = list(string)
  description = "List of source address prefixes for public traffic. Tags may not be used."
}

variable "public_traffic_priority_offset" {
  default     = 2000
  type        = number
  description = "Starting priority of public security group rules."
}

variable "private_traffic_priority_offset" {
  default     = 1000
  type        = number
  description = "Starting priority of private security group rules."
}

variable "nsg_name" {
  description = "Name of an existing network security group to add rules to"
  type        = string
}

variable "nsg_resource_group" {
  description = "Name of the resource group of the network security group"
  type        = string
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

variable "gen2_fs_id" {
  description = "ID of the ADLS Gen2 container backing HBase"
  type        = string
}

variable "hbase_service_principal_id" {
  description = "ID of the service principal HBases uses to access the backing storage account"
  type        = string
}

variable "storage_account_id" {
  description = "ID of the storage account backing HBase"
  type        = string
}
