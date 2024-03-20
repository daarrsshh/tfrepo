resource "azurerm_application_insights" "appinsights" {
  # for_each = var.appinsights_config
  name = "ssna-${var.service}-appinsights-${var.product}-${terraform.workspace}-${var.location}" #var.appinsights_config.appname
  location = var.location
  resource_group_name = var.resource_group_name
  application_type    = var.appinsights_config.apptype
  # workspace_id = var.workspace_id
}