resource "azurerm_user_assigned_identity" "adls_gen2_identity" {
  name                = var.identity_name
  resource_group_name = var.resource_group_name
  location            = var.location
}

resource "azurerm_role_assignment" "blob-owner-role-assigment" {
  scope                = var.storage_account_id
  role_definition_name = "Storage Blob Data Owner"
  principal_id         = azurerm_user_assigned_identity.adls_gen2_identity.principal_id
}
