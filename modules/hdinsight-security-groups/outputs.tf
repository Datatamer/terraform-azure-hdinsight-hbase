output "network_security_group_name" {
  value       = azurerm_network_security_group.hdinsight-hbase-nsg.name
  description = "Name of the private network security group"
}

output "network_security_group_id" {
  value       = azurerm_network_security_group.hdinsight-hbase-nsg.id
  description = "Id of the private network security group"
}
