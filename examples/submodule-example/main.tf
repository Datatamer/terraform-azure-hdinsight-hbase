resource "azurerm_resource_group" "hdinsight-rg" {
  name     = "tamr-hdinsight-hbase-resource-group"
  location = "East US"
}

resource "azurerm_virtual_network" "hdinsight-vnet" {
  depends_on          = [azurerm_resource_group.hdinsight-rg]
  name                = "example-vnet"
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

module "hdinsight_nsg" {
  source               = "../../modules/hdinsight-security-groups"
  module_depends_on    = [module.hdinsight_hbase_network]
  location             = azurerm_resource_group.hdinsight-rg.location
  resource_group_name  = azurerm_resource_group.hdinsight-rg.name
  subnet_id            = module.hdinsight_hbase_network.subnet_id
  nsg_name             = "tamr-hdinsight-nsg"
  az_dns_service_used  = true
  ssh_address_prefixes = ["1.2.3.4"]
}

module "hdinsight_storage" {
  source                     = "../../modules/hdinsight-storage"
  module_depends_on          = [module.hdinsight_hbase_network]
  hbase_storage_account_name = "tamrstorageaccount"
  location                   = azurerm_resource_group.hdinsight-rg.location
  resource_group_name        = azurerm_resource_group.hdinsight-rg.name
  storage_container_name     = "tamr-storage-container"
  virtual_network_subnet_id  = module.hdinsight_hbase_network.subnet_id
}

module "hdinsight" {
  source                             = "../../modules/hdinsight-hbase-cluster"
  cluster_name                       = "tamr-hdinsight-cluster"
  gateway_password                   = "TamrIsGreat123"
  location                           = azurerm_resource_group.hdinsight-rg.location
  network_resource_group             = azurerm_resource_group.hdinsight-rg.name
  path_to_ssh_key                    = "~/.ssh/azure.pub"
  resource_group_name                = azurerm_resource_group.hdinsight-rg.name
  storage_account_primary_access_key = module.hdinsight_storage.storage_account_primary_access_key
  storage_container_id               = module.hdinsight_storage.storage_container_id
  worker_count                       = "2"
  subnet_id                          = module.hdinsight_hbase_network.subnet_id
  vnet_id                            = azurerm_virtual_network.hdinsight-vnet.id
}
