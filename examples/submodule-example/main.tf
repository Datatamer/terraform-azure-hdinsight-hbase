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

module "hdinsight_networking" {
  source = "../../modules/hdinsight-networking"
  resource_group_name = azurerm_resource_group.hdinsight-rg.name
  vnet_name = azurerm_virtual_network.hdinsight-vnet.name
  subnet_name = "test-subnet"
  address_prefixes = ["10.0.1.0/24"]
}

module "hdinsight_nsg" {
  source = "../../modules/hdinsight-security-groups"
  location = azurerm_resource_group.hdinsight-rg.location
  resource_group_name = azurerm_resource_group.hdinsight-rg.name
  subnet_id = module.hdinsight_networking.subnet_id
  nsg_name = "example-nsg"
}

module "hdinsight_storage" {
  source = "../../modules/hdinsight-storage"
  hbase_storage_account_name = "example-account-name"
  location = azurerm_resource_group.hdinsight-rg.location
  resource_group_name = azurerm_resource_group.hdinsight-rg.name
  storage_container_name = "example-container-name"
  virtual_network_subnet_id = module.hdinsight_networking.subnet_id
}

module "hdinsight" {
  source = "../../modules/hdinsight-hbase-cluster"
  cluster_name = "example-cluster"
  gateway_password = "example-password"
  location = azurerm_resource_group.hdinsight-rg.location
  network_resource_group = azurerm_resource_group.hdinsight-rg.name
  path_to_ssh_key = "path/to/ssh/key"
  resource_group_name = azurerm_resource_group.hdinsight-rg.name
  storage_account_primary_access_key = module.hdinsight_storage.storage_account_primary_access_key
  storage_container_id = module.hdinsight_storage.storage_container_id
  subnet_name = module.hdinsight_networking.subnet_name
  vnet_name = azurerm_virtual_network.hdinsight-vnet.name
  worker_count = "2"
}
