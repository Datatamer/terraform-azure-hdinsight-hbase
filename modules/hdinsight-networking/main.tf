resource "azurerm_subnet" "hdinsight-subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.address_prefixes
  service_endpoints    = var.additional_service_endpoints
}

//Network security group
resource "azurerm_network_security_group" "hdinsight-hbase-nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_subnet_network_security_group_association" "nsg-subnet-connection" {
  network_security_group_id = azurerm_network_security_group.hdinsight-hbase-nsg.id
  subnet_id                 = azurerm_subnet.hdinsight-subnet.id
}
