output "hdinsight_hbase_cluster_name" {
  value       = azurerm_hdinsight_hbase_cluster.hdinsight_hbase_cluster.name
  description = "Name of the HDInsight Hbase cluster"
}

output "hdinsight_hbase_cluster_id" {
  value       = azurerm_hdinsight_hbase_cluster.hdinsight_hbase_cluster.id
  description = "Id of the HDInsight Hbase cluster"
}
