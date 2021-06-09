#
# Hbase cluster
#
resource "azurerm_hdinsight_hbase_cluster" "hdinsight_hbase_cluster" {
  name                = var.cluster_name
  resource_group_name = var.resource_group_name
  location            = var.location
  cluster_version     = var.hdinsight_cluster_version
  tier                = var.cluster_tier

  component_version {
    hbase = var.hbase_version
  }

  gateway {
    enabled  = true
    username = var.gateway_username
    password = var.gateway_password
  }

  storage_account {
    storage_container_id = var.storage_container_id
    storage_account_key  = var.storage_account_primary_access_key
    is_default           = true
  }

  roles {
    head_node {
      vm_size            = var.head_node_vm_size
      username           = var.username
      ssh_keys           = [file(var.path_to_ssh_key)]
      subnet_id          = var.subnet_id
      virtual_network_id = var.vnet_id
    }

    worker_node {
      vm_size               = var.worker_node_vm_size
      username              = var.username
      ssh_keys              = [file(var.path_to_ssh_key)]
      subnet_id             = var.subnet_id
      virtual_network_id    = var.vnet_id
      target_instance_count = var.worker_count

      # Schedule based auto-scaling
      autoscale {
        recurrence {
          timezone = var.scaling_timezone
          dynamic "schedule" {
            for_each = var.scaling_times
            content {
              days = var.scaling_days
              time                  = schedule.value
              target_instance_count = var.scaled_target_instance_counts[schedule.key]
            }
          }
        }
      }
    }

    zookeeper_node {
      vm_size            = var.zk_node_vm_size
      username           = var.username
      ssh_keys           = [file(var.path_to_ssh_key)]
      subnet_id          = var.subnet_id
      virtual_network_id = var.vnet_id
    }
  }

  lifecycle {
    ignore_changes = [
      tier,   # otherwise doesn't ignore case
      gateway # so password can be removed after creation
    ]
  }

  tags = var.tags
}
