output "storage_account_id" {
  value       = module.hdinsight_hbase_storage.storage_account_id
  description = "The ID of the Storage Account"
}

output "storage_container_id" {
  value       = module.hdinsight_hbase_storage.storage_container_id
  description = "The ID of the Storage Container"
}

output "hbase_cluster_id" {
  value       = module.hdinsight_cluster.hbase_cluster_id
  description = "The ID of the HDInsight HBase cluster"
}

output "hdinsight_cluster" {
  value       = module.hdinsight_cluster.hdinsight_cluster
  description = "All of the outputs of the HDInsight HBase cluster"
}

output "storage_account_primary_access_key" {
  value       = module.hdinsight_hbase_storage.storage_account_primary_access_key
  description = "Primary access key of the storage account"
}

output "storage_account_name" {
  value       = module.hdinsight_hbase_storage.storage_account_name
  description = "Name of the storage account"
}
