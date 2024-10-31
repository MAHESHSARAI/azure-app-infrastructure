provider "azurerm" {
  features {}
}

module "keyvault" {
  source              = "../../../modules/keyvault"
  region              = var.region
  environment         = var.environment
  company             = var.company
  resource_group_name = var.resource_group_name
  api_private_key     = var.api_private_key
}

module "cosmosdb" {
  source              = "../../../modules/cosmosdb"
  region              = var.region
  environment         = var.environment
  company             = var.company
  resource_group_name = var.resource_group_name
}

module "app_service" {
  source              = "../../../modules/app_service"
  region              = var.region
  environment         = var.environment
  company             = var.company
  resource_group_name = var.resource_group_name
  api_private_key     = var.api_private_key
}
