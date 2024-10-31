resource "azurerm_key_vault" "main" {
  name                        = "${var.company}-${var.environment}-keyvault"
  location                    = var.region
  resource_group_name         = var.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"

  network_acls {
    default_action = "Allow"
  }
}

resource "azurerm_key_vault_secret" "api_private_key" {
  name         = "api-private-key"
  value        = var.api_private_key
  key_vault_id = azurerm_key_vault.main.id
}
