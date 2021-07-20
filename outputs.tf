output "hbase_cluster_id" {
  value       = module.hdinsight_cluster.hbase_cluster_id
  description = "The ID of the HDInsight HBase cluster"
}

output "hdinsight_cluster" {
  value       = module.hdinsight_cluster.hdinsight_cluster
  description = "All of the outputs of the HDInsight HBase cluster"
}

output "public_security_group_rules" {
  value       = module.public_security_group_rules
  description = "Security group for user traffic"
}

output "private_security_group_rules" {
  value       = module.public_security_group_rules
  description = "Security group for services traffic"
}
