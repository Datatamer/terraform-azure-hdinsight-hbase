<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| azurerm | =2.11.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | =2.11.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| location | Azure location where the network security group will be created | `string` | n/a | yes |
| private\_nsg\_name | Name of the private network security group | `string` | n/a | yes |
| public\_nsg\_name | Name of the public network security group | `string` | n/a | yes |
| resource\_group | Name of the resource group for the network security group | `string` | n/a | yes |
| subnet\_id | Id of the subnet | `string` | n/a | yes |
| tags | Map of tags to attach to HBase cluster and storage account | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| private\_network\_security\_group\_id | Id of the private network security group |
| private\_network\_security\_group\_name | Name of the private network security group |
| public\_network\_security\_group\_id | Id of the public network security group |
| public\_network\_security\_group\_name | Name of the public network security group |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
