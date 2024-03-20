# module "rg" {
#   source   = "../tfs_azurerm_truth/rg"
#   location = var.location
#   product = var.product
# }

# locals {
#   resource_group_name = "tfs_rg_dev_eus_sitl"
#   location            = var.location
# }

resource "azurerm_log_analytics_workspace" "log_analytics_work" {
  name                = "ssna-loganalytic-${var.product}-${terraform.workspace}-${var.location}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  retention_in_days   = var.retention
}