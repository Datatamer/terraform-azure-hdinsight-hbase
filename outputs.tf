output "storage_account_id" {
  value       = module.hdinsight_hbase_storage.storage_account_id
  description = "The ID of the Storage Account"
}

output "storage_container_id" {
  value       = module.hdinsight_hbase_storage.storage_container_id
  description = "The ID of the Storage Container"
}

output "storage_container_name" {
  value       = module.hdinsight_hbase_storage.storage_container_name
  description = "The name of the storage container"
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

output "public_security_group_rules" {
  value       = module.public_security_group_rules
  description = "Security group for user traffic"
}

output "private_security_group_rules" {
  value       = module.public_security_group_rules
  description = "Security group for services traffic"
}
