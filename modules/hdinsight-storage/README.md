# TAMR Azure HDInsight Storage Module

This module creates the required storage account and container for Azure HDInsight

## Examples

```
module "hdinsight_hbase_storage" {
  source = "./modules/hdinsight-storage"
  hbase_storage_account_name = "examplestorageaccount"
  resource_group_name = "example-resource-group"
  location = "example-Azure-location"
  storage_container_name = "exampleazurecontainer"
  virtual_network_subnet_id = "example-vnet"
  enable_https_traffic_only = true
  ip_rules = []
  network_rules_default_action = "Deny"
  storage_account_access_tier = "Hot"
  storage_account_kind = "StorageV2"
  storage_account_replication_type = "ZRS"
  storage_account_tier = "Standard"
  storage_container_access_type = "private"
  tags = []
}
```

## Resources created
This module creates the following resources:
* 1 storage container
* 1 storage account

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| hbase\_storage\_account\_name | Name if the HDInsight hbase storage account | `string` | n/a | yes |
| location | Location of the Azure region | `string` | n/a | yes |
| resource\_group\_name | Name of the resource group where the azure storage account will be created | `string` | n/a | yes |
| storage\_container\_name | Name of the container in the storage account | `string` | n/a | yes |
| virtual\_network\_subnet\_id | Subnet ID for the storage account in the virtual network | `string` | n/a | yes |
| enable\_https\_traffic\_only | Force https traffic only boolean flag | `bool` | `true` | no |
| ip\_rules | List of IPs explicitly allowed to access UI | `list(string)` | `[]` | no |
| network\_rules\_default\_action | Default action for the network rules. Options are Allow or Deny | `string` | `"Deny"` | no |
| storage\_account\_access\_tier | Access tier of the storage account. Options are Hot and Cool | `string` | `"Hot"` | no |
| storage\_account\_kind | Type of storage account. Options are BlobStorage, BlockBlogStorage, FileStorage, Storage, StorageV2 | `string` | `"StorageV2"` | no |
| storage\_account\_replication\_type | Replication type of the storage account. Options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS | `string` | `"ZRS"` | no |
| storage\_account\_tier | Account tier of the storage account. Options are Standard and Premium | `string` | `"Standard"` | no |
| storage\_container\_access\_type | Access type of the storage container. Options blob, container or private | `string` | `"private"` | no |
| tags | Map of tags to attach to HBase cluster and storage account | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| storage\_account\_id | ID of the azure storage account |
| storage\_account\_primary\_access\_key | Primary access key of the storage account |
| storage\_container\_id | ID of the azure storage container |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## References
This repo is based on:
* https://www.terraform.io/docs/providers/azurerm/r/storage_account.html
* https://www.terraform.io/docs/providers/azurerm/r/storage_container.html
