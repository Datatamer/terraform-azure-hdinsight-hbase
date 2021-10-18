output "hbase_cluster_id" {
  value       = module.hdinsight.hbase_cluster_id
  description = "The ID of the HDInsight HBase cluster"
}

output "hbase_cluster" {
  value       = module.hdinsight.hdinsight_cluster
  description = "The HDInsight HBase cluster"
}

output "gateway_password" {
  value       = random_password.gateway_pass.result
  description = "Password for the Ambari gateway"
}

output "storage_account_primary_access_key" {
  value       = module.adls_gen2.storage_account_primary_access_key
  description = "Acess key for ADLS Gen2 storage account"
}

output "storage_account_name" {
  value       = module.adls_gen2.storage_account_name
  description = "Name of the storage account"
}

output "gen2_name" {
  value       = module.adls_gen2.gen2_fs_name
  description = "Name of ADLS Gen2 container"
}

output "private_key" {
  value     = tls_private_key.azure_ssh.private_key_pem
  sensitive = true
}
