resource "azurerm_cosmosdb_account" "main" {
  name                = "${var.company}-${var.environment}-cosmosdb"
  location            = var.region
  resource_group_name = var.resource_group_name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  consistency_policy {
    consistency_level = "Session"
  }

  capabilities {
    name = "EnableServerless"
  }
}
