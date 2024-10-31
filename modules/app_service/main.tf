resource "azurerm_app_service_plan" "main" {
  name                = "${var.company}-${var.environment}-asp"
  location            = var.region
  resource_group_name = var.resource_group_name
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "main" {
  name                = "${var.company}-${var.environment}-api"
  location            = var.region
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.main.id

  app_settings = {
    "API_PRIVATE_KEY" = var.api_private_key
  }
}
