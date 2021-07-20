# TAMR Azure ADLS Gen2 Backing Identity

This module creates a service principal to enable HBase to connect to ADLS Gen2 storage backing the cluster

## Examples

```
module "hdinsight_service_principal" {
  #source = "git::https://github.com/Datatamer/terraform-azure-hdinsight-hbase.git//modules/adls-gen2-backing-identity?ref=x.y.z"

  identity_name       = "principalname"
  resource_group_name = "rgname"
  location            = "eastus2"
  storage_account_id  = "storageid"
}
```

## Resources created
This module creates the following resources:
* 1 service principal

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
| location | Location in which to create resources | `string` | n/a | yes |
| resource\_group\_name | Name of resource group | `string` | n/a | yes |
| storage\_account\_id | ID of storage account the service principal will have access to | `string` | n/a | yes |
| identity\_name | Name to assign to service principal | `string` | `"hbasegen2principal"` | no |

## Outputs

| Name | Description |
|------|-------------|
| identity\_resource\_id | ID of managed identity resource |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## References
Service principal documentation:
* https://docs.microsoft.com/en-us/azure/active-directory/develop/app-objects-and-service-principals
