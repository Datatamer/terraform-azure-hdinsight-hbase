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
    username = var.gateway_username
    password = var.gateway_password
  }

  storage_account_gen2 {
    is_default                   = true
    filesystem_id                = var.storage_container_id
    managed_identity_resource_id = var.managed_identity_resource_id
    storage_resource_id          = var.storage_account_id
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
            for_each = var.scaling_schedule
            content {
              days                  = var.scaling_days
              time                  = schedule.key
              target_instance_count = schedule.value
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
      tier,                              # otherwise doesn't ignore case
      gateway,                           # so password can be removed after creation
      roles[0].worker_node[0].autoscale, # so user can add additional scheduled scalings through the UI
    ]
  }

  tags = var.tags
}
