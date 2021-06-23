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

  # names
  cluster_name           = "minimal-hdinsight-cluster"
  storage_container_name = "minimalstoragecontainer"
  hbase_storage_name     = "minimalhbasestorage"

  # scale
  worker_count = 3

  # resource group
  location            = azurerm_resource_group.hdinsight-rg.location
  resource_group_name = azurerm_resource_group.hdinsight-rg.name

  # subnets/vnets
  subnet_id        = module.hdinsight_networking.subnet_id
  vnet_id          = azurerm_virtual_network.hdinsight-vnet.id
  gateway_password = random_password.gateway_pass.result

  # creds
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
