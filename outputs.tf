output "storage_account_id" {
    value = azurerm_storage_account.modulestoragev2.id
    description = "The ID of the Storage Account"
}

output "storage_container_id" {
    value = azurerm_storage_container.module-hdinsight.id
    description = "The ID of the Storage Container"
}

output "hbase_cluster_id" {
    value = azurerm_hdinsight_hbase_cluster.module-hdinsight.id
    description = "The ID of the HDInsight HBase cluster"
}
