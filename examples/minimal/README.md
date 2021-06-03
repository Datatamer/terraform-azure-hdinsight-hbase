<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| azurerm | =2.60.0 |
| random | =3.0.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | =2.60.0 |
| random | =3.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| your\_ip | Your IP so that you can access the ambari portal and storage container | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| gateway\_password | Password for the ambari gateway |
| hbase\_cluster | The HDInsight HBase cluster |
| hbase\_cluster\_id | The ID of the HDInsight HBase cluster |
| storage\_account\_id | The ID of the Storage Account |
| storage\_account\_name | Name of the storage account |
| storage\_account\_primary\_access\_key | Primary access key of the storage account |
| storage\_container\_id | The ID of the Storage Container |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
