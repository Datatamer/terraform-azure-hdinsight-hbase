resource "azurerm_resource_group" "hdinsight-rg" {
  name     = "tamr-hdinsight-hbase-resource-group"
  location = "East US"
}

resource "azurerm_virtual_network" "hdinsight-vnet" {
  depends_on          = [azurerm_resource_group.hdinsight-rg]
  name                = "hdinsight-hbase-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.hdinsight-rg.location
  resource_group_name = azurerm_resource_group.hdinsight-rg.name
}

module "hdinsight_hbase_network" {
  source                       = "../../modules/hdinsight-networking"
  module_depends_on            = [azurerm_virtual_network.hdinsight-vnet]
  resource_group_name          = azurerm_resource_group.hdinsight-rg.name
  subnet_name                  = "hdinsight-hbase-subnet"
  vnet_name                    = azurerm_virtual_network.hdinsight-vnet.name
  additional_service_endpoints = ["Microsoft.Storage"]
  address_prefixes             = ["10.0.0.0/24"]
}

module "hdinsight_hbase" {
  source                          = "../../"
  module_depends_on               = [module.hdinsight_hbase_network]
  cluster_name                    = "tamr-hdinsight-cluster-name"
  existing_network_resource_group = azurerm_resource_group.hdinsight-rg.name
  gateway_password                = "TamrIsGreat123"
  hbase_storage_name              = "tamrstoragename"
  location                        = azurerm_resource_group.hdinsight-rg.location
  nsg_name                        = "tamr-hdinsight-nsg"
  path_to_ssh_key                 = "~/.ssh/azure.pub"
  resource_group_name             = azurerm_resource_group.hdinsight-rg.name
  storage_container_name          = "tamr-storage-container"
  vnet_id                         = azurerm_virtual_network.hdinsight-vnet.id
  worker_count                    = "2"
  az_dns_service_used             = true
  subnet_id                       = module.hdinsight_hbase_network.subnet_id
  ssh_address_prefixes            = ["1.2.3.4"]
}
