resource "azurerm_resource_group" "hdinsight-rg" {
  name = "tamrDatabricksResourceGroup"
  location = "East US"
}

module "hdinsight" {
  source = "../../"
  cluster_name = "test-cluster"
  existing_network_resource_group = azurerm_resource_group.hdinsight-rg.name
  gateway_password = "gr8people"
  hbase_storage_name = "test-hbase-storage"
  ip_rules = ""
  location = azurerm_resource_group.hdinsight-rg.location
  resource_group_name = azurerm_resource_group.hdinsight-rg.name
  ssh_key = ""
  storage_container_name = "test-storage-container"
  worker_count = 2
  subnet_name = "test-subnet"
  vnet_name = "test-vnet"
}
