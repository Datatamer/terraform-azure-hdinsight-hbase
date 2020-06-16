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

resource "azurerm_subnet" "hdinsight-subnet" {
  name                 = "examplesubnet"
  resource_group_name  = azurerm_resource_group.hdinsight-rg.name
  virtual_network_name = azurerm_virtual_network.hdinsight-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
  service_endpoints = ["Microsoft.Storage"]
}

module "hdinsight" {
  source = "../../"
  cluster_name = "example-cluster"
  existing_network_resource_group = azurerm_resource_group.hdinsight-rg.name
  gateway_password = "Password123"
  hbase_storage_name = "examplestorage"
  ip_rules = ["1.2.3.4"]
  location = azurerm_resource_group.hdinsight-rg.location
  resource_group_name = azurerm_resource_group.hdinsight-rg.name
  path_to_ssh_key = "~/.ssh/key.pub"
  storage_container_name = "examplestoragecontainer"
  subnet_name = azurerm_subnet.hdinsight-subnet.name
  vnet_name = azurerm_virtual_network.hdinsight-vnet.name
  worker_count = "1"
}
