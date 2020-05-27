resource "azurerm_storage_account" "modulestoragev2" {
  name                     = var.hbase_storage_name
  resource_group_name      = data.azurerm_resource_group.tamr_rg.name
  location                 = var.location
  # this is the backend engine
  account_kind             = var.storage_account_kind
  account_tier             = var.storage_account_tier
  access_tier              = "Hot"
  # zone redundant storage
  account_replication_type = var.storage_account_replication_type

  enable_advanced_threat_protection = var.enable_advanced_threat_protection
  enable_https_traffic_only = true

  network_rules {
    default_action             = "Deny"
    ip_rules                   = var.ip_rules
    virtual_network_subnet_ids = [data.azurerm_subnet.subnet_selected.id]
  }
  
  tags = var.tags
}

resource "azurerm_storage_container" "module-hdinsight" {
  name                  = var.storage_container_name
  resource_group_name   = data.azurerm_resource_group.tamr_rg.name
  storage_account_name  = azurerm_storage_account.modulestoragev2.name
  container_access_type = "private"
}

#
# Hbase cluster
#
resource "azurerm_hdinsight_hbase_cluster" "module-hdinsight" {
  name                = var.cluster_name
  resource_group_name = data.azurerm_resource_group.tamr_rg.name
  location            = var.location
  # this specific so tf plan comes back unchanged
  cluster_version     = var.hdinsights_cluster_version
  tier                = "Standard"

  component_version {
    hbase = "1.1"
  }

  gateway {
    enabled  = true
    username = var.gateway_username
    password = var.gateway_password
  }

  storage_account {
    storage_container_id = azurerm_storage_container.module-hdinsight.id
    storage_account_key  = azurerm_storage_account.modulestoragev2.primary_access_key
    is_default           = true
  }

  roles {
    head_node {
      vm_size             = var.head_node_vm_size
      username            = var.username
      ssh_keys            = [var.ssh_key]
      subnet_id           = data.azurerm_subnet.subnet_selected.id
      virtual_network_id  = data.azurerm_virtual_network.selected.id
    }

    worker_node {
      vm_size                  = var.worker_node_vm_size
      username                 = var.username
      ssh_keys                 = [var.ssh_key]
      subnet_id                = data.azurerm_subnet.subnet_selected.id
      virtual_network_id       = data.azurerm_virtual_network.selected.id
      target_instance_count    = var.worker_count
    }

    zookeeper_node {
      vm_size            = var.zk_node_vm_size
      username           = var.username
      ssh_keys           = [var.ssh_key]
      subnet_id          = data.azurerm_subnet.subnet_selected.id
      virtual_network_id = data.azurerm_virtual_network.selected.id
    }
  }
  lifecycle {
    ignore_changes = [
      "tier", # otherwise doesn't ignore case
      "gateway" # so password can be removed after creation
    ]
  }
  
  tags = var.tags
}
