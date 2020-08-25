# TAMR Azure HDInsight Networking module

The module creates a subnet with the required service endpoints for Azure HDInsight Hbase cluster

## Examples

```
module "hdinsight_networking" {
  source = "./modules/hdinsight-networking"
  resource_group_name = "examplereourcegroup"
  vnet_name = "examplevnetname"
  subnet_name = "test-subnet"
  address_prefixes = ["1.2.3.4/24"]
  additional_service_endpoints = ["Microsoft.Storage"]
}
```

## Resources created
This module creates the following resources:
* 1 subnet

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
| resource\_group\_name | Name of the resource group | `string` | n/a | yes |
| subnet\_name | Name of the subnet | `string` | n/a | yes |
| vnet\_name | Name of the Virtual Network | `string` | n/a | yes |
| additional\_service\_endpoints | List of additional service endpoints | `list(string)` | <pre>[<br>  "Microsoft.Storage"<br>]</pre> | no |
| address\_prefixes | List of cidr blocks for address prefixes | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| subnet\_id | Id of the created subnet |
| subnet\_name | Name of the created subnet |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## References
- https://www.terraform.io/docs/providers/azurerm/r/subnet.html
