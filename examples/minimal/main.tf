resource "azurerm_resource_group" "hdinsight-rg" {
  name = "minimal-hdinsight-cluster-example-rg"
  location = "East US 2"
}

resource "azurerm_virtual_network" "hdinsight-vnet" {
  name                = "minimal-hdinsight-cluster-example-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.hdinsight-rg.location
  resource_group_name = azurerm_resource_group.hdinsight-rg.name
}

module "hdinsight_networking" {
  source = "../../modules/hdinsight-networking"
  subnet_name = "minimal-hdinsight-cluster-example-subnet"
  resource_group_name = azurerm_resource_group.hdinsight-rg.name
  vnet_name = azurerm_virtual_network.hdinsight-vnet.name
  address_prefixes = ["10.0.1.0/24"]
}

module "hdinsight" {
  source = "../../"

  # names
  cluster_name = "minimal-hdinsight-cluster"
  storage_container_name = "minimalstoragecontainer"
  hbase_storage_name = "minimalhbasestorage"

  # scale
  worker_count = 3

  # resource group
  location = azurerm_resource_group.hdinsight-rg.location
  resource_group_name = azurerm_resource_group.hdinsight-rg.name

  # subnets/vnets
  subnet_name = module.hdinsight_networking.subnet_name
  vnet_name = azurerm_virtual_network.hdinsight-vnet.name
  existing_network_resource_group = azurerm_resource_group.hdinsight-rg.name
  gateway_password = "Password123"

  # creds
  ip_rules = ["1.2.3.4"] # replace with your IP
  path_to_ssh_key = "~/.ssh/id_rsa.pub"
}
