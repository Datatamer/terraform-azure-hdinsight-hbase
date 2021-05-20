output "subnet_id" {
  value       = azurerm_subnet.hdinsight-subnet.id
  description = "Id of the created subnet"
}

output "subnet_name" {
  value       = azurerm_subnet.hdinsight-subnet.name
  description = "Name of the created subnet"
}

output "security_group" {
  value       = azurerm_network_security_group.hdinsight-hbase-nsg
  description = "Network security group"
}

output "address_prefixes" {
  value       = azurerm_subnet.hdinsight-subnet.address_prefixes
  description = "Address space of subnet"
}
