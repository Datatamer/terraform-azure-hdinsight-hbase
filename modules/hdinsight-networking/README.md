# TAMR Azure HDInsight Networking module

The module creates a subnet with the required service endpoints for Azure HDInsight Hbase cluster
 and an attached security group.

## Examples

```
module "service_traffic" {
  source = "git::https://github.com/Datatamer/terraform-azure-hdinsight-hbase.git//modules/hdinsight-networking?ref=2.2.0"
  nsg_name = "network-security-group"
  nsg_resource_group_name = "network-security-group-rg"
  ports = var.service_traffic_ports
  source_address_prefixes = var.service_traffic_address_prefixes
  offset = var.services_traffic_offset
}
```

## Resources created
This module creates the following resources:
* 1 subnet
* 1 security group

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
| location | Location of the Azure region | `string` | n/a | yes |
| nsg\_name | Name for the network security group | `string` | n/a | yes |
| resource\_group\_name | Name of the resource group to add the network resources to | `string` | n/a | yes |
| subnet\_name | Name of the subnet | `string` | n/a | yes |
| vnet\_name | Name of the Virtual Network | `string` | n/a | yes |
| additional\_service\_endpoints | List of additional service endpoints | `list(string)` | <pre>[<br>  "Microsoft.Storage"<br>]</pre> | no |
| address\_prefixes | List of cidr blocks for address prefixes | `list(string)` | `[]` | no |
| tags | Map of tags to attach to the security group | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| address\_prefixes | Address space of subnet |
| security\_group | Network security group |
| subnet\_id | Id of the created subnet |
| subnet\_name | Name of the created subnet |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## References
- https://www.terraform.io/docs/providers/azurerm/r/subnet.html
