resource "azurerm_subnet" "hdinsight-subnet" {
  depends_on           = [var.module_depends_on]
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.address_prefixes
  service_endpoints    = var.additional_service_endpoints
}
