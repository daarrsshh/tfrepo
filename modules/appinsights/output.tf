output "app_insights_connection" {
    value =  azurerm_application_insights.appinsights.connection_string
}

output "app_insights_instrument_key" {
  value = azurerm_application_insights.appinsights.instrumentation_key
}
