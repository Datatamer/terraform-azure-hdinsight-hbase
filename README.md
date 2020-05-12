# Tamr Azure HDInsights HBase Module

This module creates an HDInsights HBase cluster for Tamr in Azure.

# Examples
TO BE UPDATED
## Basic
Inline example implementation of the module.  This is the most basic example of what it would look like to use this module.
```
module "minimal" {
  source = "git::https://github.com/Datatamer/terraform-template-repo?ref=0.1.0"
}
```
## Minimal
Smallest complete fully working example. This example might require extra resources to run the example.
- [Minimal](https://github.com/Datatamer/terraform-template-repo/tree/master/examples/minimal)

# Resources Created
This modules creates:
* HDInsight HBase cluster
* 1 storage container
* 1 storage account

# Variables 
## Inputs
* `resource_group_name`: (required) Name of resource group
* `location`: (required) Location
* `cluster_name`: (required) Name of HD-Insights HBase cluster
* `storage_container_name`: (required) Name of HD-Insights HBase cluster storage container
* `ip_rules`: (required) Array of IPs explicitly allowed to access UI
* `subnet_id`: (required) Subnet in which to deploy HD-Insights HBase resources
* `vnet_id`: (required) Virtual network in which to deploy HBase resources
* `existing_network_resource_group`: (required) Resource group which owns the VNet
* `worker_count`: (required) Desired number of worker nodes
* `storage_account_kind`: (optional) Account kind
* `storage_account_tier`: (optional) Account tier
* `storage_account_replication_type`: (optional) Account replication type
* `username`: (optional) Username
* `ssh_key`: (required) SSH key
* `head_node_vm_size`: (optional) Head node vm size
* `worker_node_vm_size`: (optional) Worker nodes vm size
* `zk_node_vm_size`: (optional) Zookeeper nodes vm size
* `gateway_username`: (optional) Gateway username
* `gateway_password`: (required) Gateway password
* `hbase_storage_name`: (required) Name of HBase storage account
* `enable_advanced_threat_protection`: (optional) Enable advanced threat protection
* `tags`: (optional) Map of tags to attach to HBase cluster, storage account, storage container

## Outputs
* `storage_account_id`: ID of the Storage Account
* `storage_container_id`: ID of the Storage Container
* `hbase_cluster_id`: ID of the HDInsight HBase cluster

# References
This repo is based on:
* [terraform standard module structure](https://www.terraform.io/docs/modules/index.html#standard-module-structure)
* [templated terraform module](https://github.com/tmknom/template-terraform-module)

# Development
## Releasing new versions
* Update version contained in `VERSION`
* Document changes in `CHANGELOG.md`
* Create a tag in github for the commit associated with the version

# License
Apache 2 Licensed. See LICENSE for full details.
