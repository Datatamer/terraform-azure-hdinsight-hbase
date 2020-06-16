output "storage_container_id" {
  value = azurerm_storage_container.storage_container.id
}

output "storage_account_primary_access_key" {
  value = azurerm_storage_account.storage_account.primary_access_key
}

output "storage_account_id" {
  value = azurerm_storage_account.storage_account.id
}