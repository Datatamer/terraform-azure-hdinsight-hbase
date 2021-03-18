# TAMR Azure HDInsight Network Security Group Rules Module

This module creates security group rules for the passed in list of ports.

## Examples

```
module "security-rules" {
  source = "git::https://github.com/Datatamer/terraform-azure-hdinsight-hbase.git//modules/hdinsight-network-rules?ref=2.1.0"
  # Network Security Group
  nsg_name                = "nsg"
  nsg_resource_group_name = "nsg-rg"

  # Networking
  ports                   = [22, 23, 443]
  source_address_prefixes = ["1.2.3.0/24"]
  destination_address     = "VirtualNetwork"
}
```

## Resources created
This module creates the following resources:
* n security group rules

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
| nsg\_name | Name of an existing network security group to add rules to | `string` | n/a | yes |
| nsg\_resource\_group\_name | Name of the resource group of the network security group | `string` | n/a | yes |
| ports | Destination ports to create network rules for | `list(number)` | n/a | yes |
| source\_address\_prefixes | List of source address prefixes. Tags may not be used. | `list(string)` | n/a | yes |
| destination\_address | CIDR or destination IP range or \* to match any IP.<br>  Tags such as 'HDInsight', ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used." | `string` | `"HDInsight"` | no |
| priority\_offset | Starting point for security group rules. | `number` | `1000` | no |
| tags | Map of tags to attach to the security group | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| security\_group\_rule\_ssl | Network security group rule for HDInsight management |
| security\_group\_rules | Network security group rules created by this module |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## References
* https://docs.microsoft.com/en-us/azure/hdinsight/control-network-traffic#hdinsight-with-network-security-groups
