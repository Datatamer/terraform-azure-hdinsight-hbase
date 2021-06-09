module "hdinsight_hbase_storage" {
  source                           = "./modules/hdinsight-storage"
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

module "hdinsight_cluster" {
  source = "./modules/hdinsight-cluster"

  # General
  cluster_name        = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name

  # HBase
  hbase_version             = var.hbase_version
  hdinsight_cluster_version = var.hdinsight_cluster_version

  # Storage
  storage_account_primary_access_key = module.hdinsight_hbase_storage.storage_account_primary_access_key
  storage_container_id               = module.hdinsight_hbase_storage.storage_container_id

  # Networking
  subnet_id = var.subnet_id
  vnet_id   = var.vnet_id

  # SSH Access
  username        = var.username
  path_to_ssh_key = var.path_to_ssh_key

  # Portal Access
  gateway_username = var.gateway_username
  gateway_password = var.gateway_password

  # Scale
  cluster_tier = var.cluster_tier

  head_node_vm_size = var.head_node_vm_size
  zk_node_vm_size   = var.zk_node_vm_size

  worker_count        = var.worker_count
  worker_node_vm_size = var.worker_node_vm_size

  #Autoscaling configuration
  scaling_days                  = var.scaling_days
  scaling_times                 = var.scaling_times
  scaled_target_instance_counts = var.scaled_target_instance_counts
  scaling_timezone              = var.scaling_timezone

  # Metadata
  tags = var.tags
}


module "private_security_group_rules" {
  source = "./modules/hdinsight-network-rules"

  # Network Security Group
  nsg_name                = var.nsg_name
  nsg_resource_group_name = var.nsg_resource_group

  # Networking
  ports                   = var.private_traffic_ports
  source_address_prefixes = var.private_traffic_address_prefixes
  destination_address     = var.destination_address

  # Starting priority
  priority_offset = var.private_traffic_priority_offset
}

module "public_security_group_rules" {
  source = "./modules/hdinsight-network-rules"
  # Network Security Group
  nsg_name                = var.nsg_name
  nsg_resource_group_name = var.nsg_resource_group

  # Networking
  ports                   = var.public_traffic_ports
  source_address_prefixes = var.public_traffic_address_prefixes
  destination_address     = var.destination_address

  # Starting priority
  priority_offset = var.public_traffic_priority_offset
}
