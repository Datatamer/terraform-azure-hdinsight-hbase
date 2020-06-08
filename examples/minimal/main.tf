resource "azurerm_resource_group" "databricks-rg" {
  name = "tamrDatabricksResourceGroup"
  location = "East US"
}

resource "azurerm_virtual_network" "databricks-vnet" {
  name = "tamrDatabricksVirtualNetwork"

  location            = azurerm_resource_group.databricks-rg.location
  resource_group_name = azurerm_resource_group.databricks-rg.name

  address_space = ["1.2.3.0/25"]
}

module "databricks" {
  source = "../../"
  cluster_name = "test-cluster"
  existing_network_resource_group = azurerm_resource_group.databricks-rg.name
  gateway_password = "gr8people"
  hbase_storage_name = "test-hbase-storage"
  ip_rules = ""
  location = azurerm_resource_group.databricks-rg.location
  resource_group_name = azurerm_resource_group.databricks-rg.name
  ssh_key = ""
  storage_container_name = "test-storage-container"
  worker_count = 2
  subnet_name = "test-subnet"
  vnet_name = "test-vnet"
}
