output "security_group_rules" {
  value       = azurerm_network_security_rule.rule_inbound_port
  description = "Network security group rules created by this module"
}

output "security_group_rule_ssl" {
  value       = azurerm_network_security_rule.rule_ssl
  description = "Network security group rule for HDInsight management"
}
