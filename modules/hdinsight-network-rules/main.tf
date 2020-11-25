resource "azurerm_network_security_rule" "rule_inbound_port" {
  count                       = length(var.ports)
  name                        = format("Rule-%s", (var.priority_offset + 1 + count.index))
  description                 = format("Port %s", (var.ports[count.index]))
  access                      = "Allow"
  direction                   = "Inbound"
  network_security_group_name = var.nsg_name
  priority                    = var.priority_offset + 1 + count.index
  protocol                    = "Tcp"
  resource_group_name         = var.nsg_resource_group_name
  source_port_range           = "*"
  destination_port_range      = var.ports[count.index]
  source_address_prefixes     = var.source_address_prefixes
  destination_address_prefix  = var.destination_address
}

# Azure requires 443 be accessible to manage the cluster
# https://docs.microsoft.com/en-us/azure/hdinsight/control-network-traffic#hdinsight-with-network-security-groups
resource "azurerm_network_security_rule" "rule_ssl" {
  name                        = format("Rule-%s", var.priority_offset)
  description                 = format("Port %s", 443)
  access                      = "Allow"
  direction                   = "Inbound"
  network_security_group_name = var.nsg_name
  priority                    = var.priority_offset
  protocol                    = "Tcp"
  resource_group_name         = var.nsg_resource_group_name
  source_port_range           = "*"
  destination_port_range      = 443
  source_address_prefix       = "HDInsight"
  destination_address_prefix  = var.destination_address
}
