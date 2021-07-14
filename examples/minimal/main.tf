resource "azurerm_resource_group" "hdinsight-rg" {
  name     = "minimal-hdinsight-cluster-example-rg"
  location = "East US 2"
}

resource "azurerm_virtual_network" "hdinsight-vnet" {
  name                = "minimal-hdinsight-cluster-example-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.hdinsight-rg.location
  resource_group_name = azurerm_resource_group.hdinsight-rg.name
}

# Azure storage account and ADLS Gen2
module "adls_gen2" {
  source = "git::https://github.com/Datatamer/terraform-azure-adls-gen2.git?ref=1.0.0"

  instance_name       = "tamrgen2hbase"
  resource_group_name = azurerm_resource_group.hdinsight-rg.name
  location            = azurerm_resource_group.hdinsight-rg.location
}

# Network rules on ADLS Gen2 storage account
module "rules" {
  source = "git::https://github.com/Datatamer/terraform-azure-adls-gen2.git//modules/azure-storage-account-network-rules?ref=1.0.0"

  storage_account_name = module.adls_gen2.storage_account_name
  resource_group_name  = azurerm_resource_group.hdinsight-rg.name
  allowed_ips          = [var.your_ip]
  allowed_subnet_ids   = [module.hdinsight_networking.subnet_id]
}

resource "azurerm_user_assigned_identity" "adls_gen2_identity" {
  name                = "hbasegen2principal"
  resource_group_name = azurerm_resource_group.hdinsight-rg.name
  location            = azurerm_resource_group.hdinsight-rg.location
}

resource "azurerm_role_assignment" "blob-owner-role-assigment" {
  scope                = module.adls_gen2.storage_account_id
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = azurerm_user_assigned_identity.adls_gen2_identity.principal_id
}

module "hdinsight_networking" {
  #source = "git::https://github.com/Datatamer/terraform-azure-hdinsight-hbase.git//modules/hdinsight-networking?ref=3.1.0"
  source              = "../../modules/hdinsight-networking"
  subnet_name         = "minimal-hdinsight-cluster-example-subnet"
  resource_group_name = azurerm_resource_group.hdinsight-rg.name
  vnet_name           = azurerm_virtual_network.hdinsight-vnet.name
  address_prefixes    = ["10.0.1.0/24"]
  location            = azurerm_resource_group.hdinsight-rg.location
  nsg_name            = "minimal-hdinsight-network-security-group"
}

resource "random_password" "gateway_pass" {
  length  = 64
  special = true
  upper   = true
  lower   = true
}

variable "your_ip" {
  type        = string
  description = "Your IP so that you can access the ambari portal and storage container"
}

module "hdinsight" {
  #source = "git::https://github.com/Datatamer/terraform-azure-hdinsight-hbase.git?ref=3.1.0"
  source = "../../"

  cluster_name = "minimal-hdinsight-cluster"

  # Scale
  worker_count = 3

  # Resource group
  location            = azurerm_resource_group.hdinsight-rg.location
  resource_group_name = azurerm_resource_group.hdinsight-rg.name

  # Subnets/VNets
  subnet_id        = module.hdinsight_networking.subnet_id
  vnet_id          = azurerm_virtual_network.hdinsight-vnet.id
  gateway_password = random_password.gateway_pass.result

  # Storage
  gen2_fs_id                 = module.adls_gen2.gen2_fs_id
  hbase_service_principal_id = azurerm_user_assigned_identity.adls_gen2_identity.id
  storage_account_id         = module.adls_gen2.storage_account_id

  # Creds
  ip_rules        = [var.your_ip]
  path_to_ssh_key = "~/.ssh/id_rsa.pub"

  # Security Group Rules
  nsg_name           = module.hdinsight_networking.security_group.name
  nsg_resource_group = azurerm_resource_group.hdinsight-rg.name
  private_traffic_address_prefixes = [
    "10.0.0.0/16",
  ]

  public_traffic_address_prefixes = [
    var.your_ip,
  ]

  destination_address = "10.0.1.0/24"

  # Autoscaling
  # On Monday and Tuesday scale to 5 workers at 3pm, then 6 workers at 4pm
  scaling_days     = ["Monday", "Tuesday"]
  scaling_timezone = "Eastern Standard Time"
  scaling_schedule = { "15:00" : 5, "16:00" : 6 }
}
