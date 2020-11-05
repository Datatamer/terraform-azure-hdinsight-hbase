output "subnet_id" {
  value       = azurerm_subnet.hdinsight-subnet.id
  description = "Id of the created subnet"
}

output "subnet_name" {
  value       = azurerm_subnet.hdinsight-subnet.name
  description = "Name of the created subnet"
}
