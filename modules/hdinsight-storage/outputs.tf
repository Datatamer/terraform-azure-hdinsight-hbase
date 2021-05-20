output "storage_container_id" {
  value       = azurerm_storage_container.storage_container.id
  description = "ID of the azure storage container"
}

output "storage_container_name" {
  value       = azurerm_storage_container.storage_container.name
  description = "Name of the azure storage container"
}

output "storage_account_primary_access_key" {
  value       = azurerm_storage_account.storage_account.primary_access_key
  description = "Primary access key of the storage account"
}

output "storage_account_name" {
  value       = azurerm_storage_account.storage_account.name
  description = "Name of the storage account"
}

output "storage_account_id" {
  value       = azurerm_storage_account.storage_account.id
  description = "ID of the azure storage account"
}
