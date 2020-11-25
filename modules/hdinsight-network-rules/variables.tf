variable "nsg_resource_group_name" {
  type        = string
  description = "Name of the resource group of the network security group"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Map of tags to attach to the security group"
}

variable "nsg_name" {
  type        = string
  description = "Name of an existing network security group to add rules to"
}

variable "ports" {
  type        = list(number)
  description = "Destination ports to create network rules for"
}

variable "source_address_prefixes" {
  type        = list(string)
  description = "List of source address prefixes. Tags may not be used."
}

variable "destination_address" {
  type        = string
  default     = "HDInsight"
  description = <<EOF
  CIDR or destination IP range or * to match any IP.
  Tags such as 'HDInsight', ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used."
  EOF
}

variable "priority_offset" {
  type        = number
  default     = 1000
  description = "Starting point for security group rules."
}
