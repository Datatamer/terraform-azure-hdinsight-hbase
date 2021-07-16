output "identity_resource_id" {
  value       = azurerm_user_assigned_identity.adls_gen2_identity.id
  description = "ID of managed identity resource"
}
