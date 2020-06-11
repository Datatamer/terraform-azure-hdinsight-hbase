resource "azurerm_storage_account" "storage_account" {
  name                     = var.hbase_storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  # this is the backend engine
  account_kind             = var.storage_account_kind
  account_tier             = var.storage_account_tier
  access_tier              = var.storage_account_access_tier
  # zone redundant storage
  account_replication_type = var.storage_account_replication_type

  #enable_advanced_threat_protection = var.enable_advanced_threat_protection
  enable_https_traffic_only = var.enable_https_traffic_only

  network_rules {
    default_action             = var.network_rules_default_action
    ip_rules                   = var.ip_rules
    virtual_network_subnet_ids = [var.virtual_network_subnet_id]
  }

  tags = var.tags
}

resource "azurerm_storage_container" "storage_container" {
  name                  = var.storage_container_name
  resource_group_name   = var.resource_group_name
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = var.storage_container_access_type
}
