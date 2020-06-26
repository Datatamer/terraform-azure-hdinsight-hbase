resource "azurerm_resource_group" "hdinsight-rg" {
  name = "example-rg"
  location = "East US"
}

resource "azurerm_virtual_network" "hdinsight-vnet" {
  name                = "example-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.hdinsight-rg.location
  resource_group_name = azurerm_resource_group.hdinsight-rg.name
}

module "hdinsight_hbase" {
  source = "../../"
  cluster_name = "example-cluster-name"
  existing_network_resource_group = "example-networking-rg"
  gateway_password = "example-gateway-password"
  hbase_storage_name = "example-storage-name"
  location = azurerm_resource_group.hdinsight-rg.location
  nsg_name = "example-network-security-group"
  path_to_ssh_key = "path/to/ssh/key.pem"
  resource_group_name = azurerm_resource_group.hdinsight-rg.name
  storage_container_name = "example-storage-container"
  subnet_name = "example-subnet"
  vnet_name = azurerm_virtual_network.hdinsight-vnet.name
  worker_count = "2"
}
