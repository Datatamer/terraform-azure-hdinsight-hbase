output "storage_account_id" {
  value       = module.hdinsight.storage_account_id
  description = "The ID of the Storage Account"
}

output "storage_container_id" {
  value       = module.hdinsight.storage_container_id
  description = "The ID of the Storage Container"
}

output "hbase_cluster_id" {
  value       = module.hdinsight.hbase_cluster_id
  description = "The ID of the HDInsight HBase cluster"
}

output "hbase_cluster" {
  value       = module.hdinsight.hdinsight_cluster
  description = "The HDInsight HBase cluster"
}


output "storage_account_primary_access_key" {
  value       = module.hdinsight.storage_account_primary_access_key
  description = "Primary access key of the storage account"
}

output "storage_account_name" {
  value       = module.hdinsight.storage_account_name
  description = "Name of the storage account"
}

output "gateway_password" {
  value       = random_password.gateway_pass.result
  description = "Password for the ambari gateway"
}
