# Tamr Azure HDInsight HBase module

## v3.1.0 - June 22nd 2021
* Add variables `scaling_days`, `scaling_schedule`, and `scaling_timezone` to support schedule-based scaling

## v3.0.0 - June 1st 2021
* Upgrade `azurerm` provider

## v2.2.0 - May 19th 2021
* New `address_prefixes` output variable from `hdinsight-networking` submodule
* New `storage_container_name` output variable

## v2.1.0 - March 16th 2021
* Change defaults for `head_node_vm_size` and `worker_node_vm_size`.  If
  upgrading and relying on default values, this will cause the
  HDInsight cluster to be re-deployed.  Explicitly setting these
  variables to the previous values will avoid this behavior.

## v2.0.0 - November 25th 2020
* New module for security group rules
* Security group added to the networking module

## v1.0.0 - November 20th 2020
* Moves creation of the HDInsight cluster to its own module. Breaking change if upgrading from
 previous versions.
* Minor documentation updates

## v0.3.0 - November 18th 2020
* Rename all instances of "HDInsights" to "HDInsight"
* Rename repo to `terraform-azure-hdinsight-hbase`

## v0.2.1 - November 18th 2020
* Add output variables `storage_account_name` and `storage_account_primary_access_key`

## v0.2.0 - November 5th 2020
* Removes input variable `existing_network_resource_group`

## v0.1.5 - November 2nd 2020
* Removes provider.tf

## v0.1.4 - August 25th 2020
* Remove redundant internal use of data blocks for the subnet and virtual network

## v0.1.3 - August 10th 2020
* Fixes use of deprecated string values for `ignore_changes`

## v0.1.2 - June 1st 2020
* Updates the module to be compliant with Azure provider 2.11.0

## v0.1.1 - May 27th 2020
* Explicitly sets enable_https_traffic_only to true

## v0.1.0 - May 12th 2020
* Tamr Azure HDInsight HBase module added
