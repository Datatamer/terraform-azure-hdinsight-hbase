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
| location | Azure location where the network security group will be created | `string` | n/a | yes |
| nsg\_name | Name of the network security group | `string` | n/a | yes |
| resource\_group\_name | Name of the resource group for the network security group | `string` | n/a | yes |
| subnet\_id | Id of the subnet | `string` | n/a | yes |
| source\_address\_az\_dns\_service | Source Address Prefix required for all VNets | `string` | `"168.63.129.16"` | no |
| source\_address\_mgmt\_prefixes | List of Source Address Prefixes for HDInsight Management services | `list(string)` | <pre>[<br>  "168.61.49.99",<br>  "23.99.5.239",<br>  "168.61.48.131",<br>  "138.91.141.162"<br>]</pre> | no |
| source\_address\_prefixes\_mgmt\_region\_specific | List of Source Address Prefixes for HDInsight Health and Management services specific to regions. Defaults are for East US 2 | `list(string)` | <pre>[<br>  "13.82.225.233",<br>  "40.71.175.99"<br>]</pre> | no |
| tags | Map of tags to attach to HBase cluster and storage account | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| private\_network\_security\_group\_id | Id of the private network security group |
| private\_network\_security\_group\_name | Name of the private network security group |
| public\_network\_security\_group\_id | Id of the public network security group |
| public\_network\_security\_group\_name | Name of the public network security group |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

# References
This repo is based on:
* [HDInsight Management IP Address](https://docs.microsoft.com/en-us/azure/hdinsight/hdinsight-management-ip-addresses)
* [Ports for HDInsight](https://docs.microsoft.com/en-us/azure/hdinsight/hdinsight-hadoop-port-settings-for-services)
