
resource "azurerm_service_plan" "app_service_plan" {
  # for_each = var.appservice_config
  name                = "ssna-${var.service}-asp-${var.product}-${terraform.workspace}-${var.location}"
  resource_group_name = var.resource_group_name
  os_type = var.appservice_config.os_type
  sku_name = var.appservice_config.sku_name
  zone_balancing_enabled = var.appservice_config.zone_enable
  location = var.location
  worker_count = var.appservice_config.worker_count
  maximum_elastic_worker_count = var.appservice_config.max_worker
}