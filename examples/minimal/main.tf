module "minimal" {
  source = "git::https://github.com/Datatamer/terraform-azure-hdinsights-hbase.git?ref=0.1.2"
  cluster_name = "example-cluster-name"
  existing_network_resource_group = "example-resource-group"
  gateway_password = "example-gateway-password"
  hbase_storage_name = "example-storage"
  ip_rules = ["1.2.3.4", "2.3.4.5"]
  location = "example-location"
  resource_group_name = "example-resource-group-name"
  ssh_key = "example-ssh-key"
  storage_container_name = "example-storage-container-name"
  subnet_id = "example-subnet-id"
  vnet_id = "example-vnet-id"
  worker_count = 1
}
