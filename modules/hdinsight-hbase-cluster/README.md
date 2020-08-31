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
| cluster\_name | Name of HDInsight HBase cluster | `string` | n/a | yes |
| gateway\_password | Gateway password | `string` | n/a | yes |
| location | Azure region where the HDInsight HBase cluster is to be deployed | `string` | n/a | yes |
| network\_resource\_group | Resource group which owns the VNet | `string` | n/a | yes |
| path\_to\_ssh\_key | Path to the SSH key | `string` | n/a | yes |
| resource\_group\_name | Name of resource group | `string` | n/a | yes |
| storage\_account\_primary\_access\_key | Primary access key of the storage account | `string` | n/a | yes |
| storage\_container\_id | Id of the storage container | `string` | n/a | yes |
| subnet\_id | Id of the subnet | `string` | n/a | yes |
| vnet\_id | Id of the virtual network in which to deploy HBase resources | `string` | n/a | yes |
| worker\_count | Desired number of worker nodes | `number` | n/a | yes |
| cluster\_tier | The cluster tier. Optionas are Standard or Premium | `string` | `"Standard"` | no |
| gateway\_username | Gateway username | `string` | `"admin"` | no |
| hbase\_version | Version of hbase | `string` | `"1.1"` | no |
| hdinsights\_cluster\_version | Version for HDInsight cluster | `string` | `"3.6"` | no |
| head\_node\_vm\_size | Head node vm size | `string` | `"Standard_D3_V2"` | no |
| module\_depends\_on | Variable to make sure some other resources get created before the module execution | `list(any)` | `null` | no |
| tags | Map of tags to attach to HBase cluster and storage account | `map(string)` | `{}` | no |
| username | Username | `string` | `"sshuser"` | no |
| worker\_node\_vm\_size | Worker nodes vm size | `string` | `"Standard_D3_V2"` | no |
| zk\_node\_vm\_size | Zookeeper nodes vm size | `string` | `"Standard_A4_v2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| hdinsight\_hbase\_cluster\_id | Id of the HDInsight Hbase cluster |
| hdinsight\_hbase\_cluster\_name | Name of the HDInsight Hbase cluster |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
