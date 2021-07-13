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
  storage_container_id         = var.gen2_fs_id
  managed_identity_resource_id = var.hbase_service_principal_id
  storage_account_id           = var.storage_account_id

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
  scaling_days     = var.scaling_days
  scaling_timezone = var.scaling_timezone
  scaling_schedule = var.scaling_schedule

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
