output "hbase_cluster_id" {
  value       = azurerm_hdinsight_hbase_cluster.hdinsight_hbase_cluster.id
  description = "The ID of the HDInsight HBase cluster"
}

output "hdinsight_cluster" {
  value       = azurerm_hdinsight_hbase_cluster.hdinsight_hbase_cluster
  description = "All of the outputs of the HDInsight HBase cluster"
}
