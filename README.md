# Tamr Azure HDInsight HBase Module

This module creates an HDInsight HBase cluster for Tamr in Azure.

# Examples
Refer the `/examples` directory for a complete working example.

## Basic
Inline example implementation of the module.  This is the most basic example of what it would look like to use this module.
```
module "minimal" {
  source = "git::https://github.com/Datatamer/terraform-azure-hdinsight-hbase.git?ref=0.3.0"
  cluster_name = "example-cluster-name"
  gateway_password = "example-gateway-password"
  hbase_storage_name = "example-storage"
  ip_rules = ["1.2.3.4", "2.3.4.5"]
  location = "example-location"
  resource_group_name = "example-resource-group-name"
  ssh_key = "example-ssh-key"
  storage_container_name = "example-storage-container-name"
  subnet_id = "example-subnet-id"
  vnet_id = "example-vnet-id"
  worker_count = 1
}
```

# Resources Created
This modules creates:
* HDInsight HBase cluster
* 1 storage container
* 1 storage account

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| azurerm | >= 2.11.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >= 2.11.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_name | Name of HDInsight HBase cluster | `string` | n/a | yes |
| gateway\_password | Gateway password | `string` | n/a | yes |
| hbase\_storage\_name | Name of HBase storage account | `string` | n/a | yes |
| ip\_rules | Array of IPs explicitly allowed to access UI | `list(string)` | n/a | yes |
| location | Azure region where the HDInsight HBase cluster is to be deployed | `string` | n/a | yes |
| path\_to\_ssh\_key | Path to the SSH key | `string` | n/a | yes |
| resource\_group\_name | Name of resource group | `string` | n/a | yes |
| storage\_container\_name | Name of HDInsight HBase cluster storage container | `string` | n/a | yes |
| subnet\_id | ID of the subnet in which to deploy HDInsight HBase resources | `string` | n/a | yes |
| vnet\_id | ID of the virtual network in which to deploy HBase resources | `string` | n/a | yes |
| worker\_count | Desired number of worker nodes | `number` | n/a | yes |
| cluster\_tier | The cluster tier. Optionas are Standard or Premium | `string` | `"Standard"` | no |
| enable\_advanced\_threat\_protection | Enable advanced threat protection | `bool` | `false` | no |
| enable\_https\_traffic\_only | Force https traffic only boolean flag | `bool` | `true` | no |
| gateway\_username | Gateway username | `string` | `"admin"` | no |
| hbase\_version | Version of hbase | `string` | `"1.1"` | no |
| hdinsight\_cluster\_version | Version for HDInsight cluster | `string` | `"3.6"` | no |
| head\_node\_vm\_size | Head node vm size | `string` | `"Standard_D3_V2"` | no |
| network\_rules\_default\_action | Default action for the network rules. Options are Allow or Deny | `string` | `"Deny"` | no |
| storage\_account\_access\_tier | Access tier of the storage account. Options are Hot and Cool | `string` | `"Hot"` | no |
| storage\_account\_kind | Account kind | `string` | `"StorageV2"` | no |
| storage\_account\_replication\_type | Account replication type | `string` | `"ZRS"` | no |
| storage\_account\_tier | Account tier | `string` | `"Standard"` | no |
| storage\_container\_access\_type | Access type of the storage container. Options blob, container or private | `string` | `"private"` | no |
| tags | Map of tags to attach to HBase cluster and storage account | `map(string)` | `{}` | no |
| username | Username | `string` | `"sshuser"` | no |
| worker\_node\_vm\_size | Worker nodes vm size | `string` | `"Standard_D3_V2"` | no |
| zk\_node\_vm\_size | Zookeeper nodes vm size | `string` | `"Standard_A4_v2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| hbase\_cluster\_id | The ID of the HDInsight HBase cluster |
| storage\_account\_id | The ID of the Storage Account |
| storage\_account\_name | Name of the storage account |
| storage\_account\_primary\_access\_key | Primary access key of the storage account |
| storage\_container\_id | The ID of the Storage Container |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

# References
This repo is based on:
* [terraform standard module structure](https://www.terraform.io/docs/modules/index.html#standard-module-structure)
* [templated terraform module](https://github.com/tmknom/template-terraform-module)

# Development
## Releasing new versions
* Update version contained in `VERSION`
* Document changes in `CHANGELOG.md`
* Create a tag in github for the commit associated with the version

# License
Apache 2 Licensed. See LICENSE for full details.
