output "storage_account_id" {
  value       = module.hdinsight_hbase_storage.storage_account_id
  description = "The ID of the Storage Account"
}

output "storage_container_id" {
  value       = module.hdinsight_hbase_storage.storage_container_id
  description = "The ID of the Storage Container"
}

output "hbase_cluster_id" {
  value       = azurerm_hdinsight_hbase_cluster.hdinsight_hbase_cluster.id
  description = "The ID of the HDInsight HBase cluster"
}

output "storage_account_primary_access_key" {
  value       = module.hdinsight_hbase_storage.storage_account_primary_access_key
  description = "Primary access key of the storage account"
}

output "storage_account_name" {
  value       = module.hdinsight_hbase_storage.storage_account_name
  description = "Name of the storage account"
}
