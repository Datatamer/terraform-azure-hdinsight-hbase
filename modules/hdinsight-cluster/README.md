# TAMR Azure HDInsight Cluster Module

This module creates the Azure HDInsight cluster

## Examples

```
module "hdinsight_hbase_storage" {
  source = "git::https://github.com/Datatamer/terraform-azure-hdinsight-hbase.git//modules/hdinsight-cluster?ref=x.y.z"
  resource_group_name = "example-resource-group"
  location = "example-Azure-location"
  cluster_name = "hdinsight-cluster"
  vnet_id = "example-vnet"
  subnet_id = "example-subnet"
  worker_count = 3
  path_to_ssh_key = "~/.ssh/id_rsa.pub"
  gateway_password = "abcdef12345"
  storage_container_id = "container id"
  storage_account_primary_access_key = "primary access key "
}
```

## Resources created
This module creates the following resources:
* 1 HDInsight cluster

HDInsight has many underlying (e.g. virtual machines, networking resources). Consult the
 Azure documentation for details about the architecture.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |
| azurerm | >= 2.60.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >= 2.60.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_name | Name of HDInsight HBase cluster | `string` | n/a | yes |
| gateway\_password | Gateway password | `string` | n/a | yes |
| location | Azure region where the HDInsight HBase cluster is to be deployed | `string` | n/a | yes |
| managed\_identity\_resource\_id | ID of the managed identity used to access the backing storage account | `string` | n/a | yes |
| path\_to\_ssh\_key | Path to the SSH key | `string` | n/a | yes |
| resource\_group\_name | Name of resource group | `string` | n/a | yes |
| storage\_account\_id | ID of the storage account containing ADLS Gen2 instance | `string` | n/a | yes |
| storage\_container\_id | ID of the ADLS Gen2 storage container | `string` | n/a | yes |
| subnet\_id | ID of the subnet in which to deploy HDInsight HBase resources | `string` | n/a | yes |
| vnet\_id | ID of the virtual network in which to deploy HBase resources | `string` | n/a | yes |
| worker\_count | Desired number of worker nodes | `number` | n/a | yes |
| cluster\_tier | The cluster tier. Options are Standard or Premium | `string` | `"Standard"` | no |
| gateway\_username | Gateway username | `string` | `"admin"` | no |
| hbase\_version | Version of hbase | `string` | `"1.1"` | no |
| hdinsight\_cluster\_version | Version for HDInsight cluster | `string` | `"3.6"` | no |
| head\_node\_vm\_size | Head node vm size | `string` | `"Standard_D12_V2"` | no |
| scaling\_days | The days of the week to perform scaling operation. Full names expected (Monday, Tuesday, etc.) | `list(string)` | `[]` | no |
| scaling\_schedule | Scheduled scaling operations. Expects a map of time at which to scale mapped to workers to scale to. 24 hour hh:mm format expected.<br>  Example: {"15:00" : 5, "16:00" : 6} | `map(string)` | `{}` | no |
| scaling\_timezone | Timezone in which scaling times are defined. Time Zone ID expected. List of supported Azure Time Zone IDs found here:<br>  https://docs.microsoft.com/en-us/azure/azure-sql/managed-instance/timezones-overview#list-of-supported-time-zones | `string` | `""` | no |
| tags | Map of tags to attach to HBase cluster and storage account | `map(string)` | `{}` | no |
| username | Username for ssh access to the instances of the cluster | `string` | `"sshuser"` | no |
| worker\_node\_vm\_size | Worker nodes vm size | `string` | `"Standard_D12_V2"` | no |
| zk\_node\_vm\_size | Zookeeper nodes vm size | `string` | `"Standard_A4_v2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| hbase\_cluster\_id | The ID of the HDInsight HBase cluster |
| hdinsight\_cluster | All of the outputs of the HDInsight HBase cluster |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## References
HDInsight documentation:
* https://docs.microsoft.com/en-us/azure/hdinsight/hdinsight-overview
* https://docs.microsoft.com/en-us/azure/hdinsight/hdinsight-virtual-network-architecture#basic-virtual-network-resources
