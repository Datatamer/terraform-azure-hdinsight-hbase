output "public_network_security_group_name" {
  value       = azurerm_network_security_group.hdinsight_hbase_public_nsg.name
  description = "Name of the public network security group"
}

output "public_network_security_group_id" {
  value       = azurerm_network_security_group.hdinsight_hbase_public_nsg.id
  description = "Id of the public network security group"
}

output "private_network_security_group_name" {
  value       = azurerm_network_security_group.hdinsight_hbase_private_nsg.name
  description = "Name of the private network security group"
}

output "private_network_security_group_id" {
  value       = azurerm_network_security_group.hdinsight_hbase_private_nsg.id
  description = "Id of the private network security group"
}
