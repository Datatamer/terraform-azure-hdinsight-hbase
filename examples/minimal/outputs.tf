output "storage_account_id" {
  value = module.hdinsight.storage_account_id
  description = "The ID of the Storage Account"
}

output "storage_container_id" {
  value = module.hdinsight.storage_container_id
  description = "The ID of the Storage Container"
}

output "hbase_cluster_id" {
  value = module.hdinsight.hbase_cluster_id
  description = "The ID of the HDInsight HBase cluster"
}
