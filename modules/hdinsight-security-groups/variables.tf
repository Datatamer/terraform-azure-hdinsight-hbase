variable "nsg_name" {
  type = string
  description = "Name of the network security group"
}

//variable "private_nsg_name" {
//  type = string
//  description = "Name of the private network security group"
//}

variable "location" {
  type = string
  description = "Azure location where the network security group will be created"
}

variable "resource_group_name" {
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

//The following prefixes are mentioned in the azure docs here:
//https://docs.microsoft.com/en-us/azure/hdinsight/hdinsight-management-ip-addresses#health-and-management-services-all-regions
variable "source_address_mgmt_prefixes" {
  type = list(string)
  description = "List of Source Address Prefixes for HDInsight Management services"
  default = [
    "168.61.49.99",
    "23.99.5.239",
    "168.61.48.131",
    "138.91.141.162"
  ]
}

//The following prefix is mentioned in the azure docs here:
//https://docs.microsoft.com/en-us/azure/hdinsight/hdinsight-management-ip-addresses#azure-dns-service
variable "source_address_az_dns_service" {
  type = string
  description = "Source Address Prefix required for all VNets"
  default = "168.63.129.16"
}

//The following prefixes are mentioned in the azure docs here:
//https://docs.microsoft.com/en-us/azure/hdinsight/hdinsight-management-ip-addresses#health-and-management-services-specific-regions
variable "source_address_prefixes_mgmt_region_specific" {
  type = list(string)
  description = "List of Source Address Prefixes for HDInsight Health and Management services specific to regions. Defaults are for East US 2"
  default = [
    "13.82.225.233",
    "40.71.175.99"
  ]
}
