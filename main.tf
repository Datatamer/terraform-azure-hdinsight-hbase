#
# Hbase network security groups
#
module "hdinsight_hbase_nsg" {
  source               = "./modules/hdinsight-security-groups"
  module_depends_on    = [var.module_depends_on]
  location             = var.location
  nsg_name             = var.nsg_name
  resource_group_name  = var.resource_group_name
  subnet_id            = var.subnet_id
  tags                 = var.tags
  az_dns_service_used  = var.az_dns_service_used
  ssh_address_prefixes = var.ssh_address_prefixes
}

#
# Hbase storage
#
module "hdinsight_hbase_storage" {
  source                           = "./modules/hdinsight-storage"
  module_depends_on                = [var.module_depends_on]
  hbase_storage_account_name       = var.hbase_storage_name
  resource_group_name              = var.resource_group_name
  location                         = var.location
  storage_container_name           = var.storage_container_name
  virtual_network_subnet_id        = var.subnet_id
  enable_https_traffic_only        = var.enable_https_traffic_only
  ip_rules                         = var.ip_rules
  network_rules_default_action     = var.network_rules_default_action
  storage_account_access_tier      = var.storage_account_access_tier
  storage_account_kind             = var.storage_account_kind
  storage_account_replication_type = var.storage_account_replication_type
  storage_account_tier             = var.storage_account_tier
  storage_container_access_type    = var.storage_container_access_type
  tags                             = var.tags
}

#
# Hbase cluster
#
module hdinsight_hbase_cluster {
  source                             = "./modules/hdinsight-hbase-cluster"
  module_depends_on                  = [var.module_depends_on]
  cluster_name                       = var.cluster_name
  gateway_username                   = var.gateway_username
  gateway_password                   = var.gateway_password
  location                           = var.location
  network_resource_group             = var.existing_network_resource_group
  path_to_ssh_key                    = var.path_to_ssh_key
  resource_group_name                = var.resource_group_name
  storage_account_primary_access_key = module.hdinsight_hbase_storage.storage_account_primary_access_key
  storage_container_id               = module.hdinsight_hbase_storage.storage_container_id
  subnet_id                          = var.subnet_id
  vnet_id                            = var.vnet_id
  worker_count                       = var.worker_count
  cluster_tier                       = var.cluster_tier
  hbase_version                      = var.hbase_version
  hdinsights_cluster_version         = var.hdinsights_cluster_version
  head_node_vm_size                  = var.head_node_vm_size
  username                           = var.username
  worker_node_vm_size                = var.worker_node_vm_size
  zk_node_vm_size                    = var.zk_node_vm_size
  tags                               = var.tags
}
