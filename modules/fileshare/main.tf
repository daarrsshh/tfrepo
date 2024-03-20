resource "azurerm_storage_share" "logic_app_storage_account_share" {
  name                 =var.name
  storage_account_name = var.storage_name
  quota                = var.quota
}