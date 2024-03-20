resource "azurerm_eventgrid_system_topic" "event_topic" {
  name                = "ssna-storage-${terraform.workspace}-${var.event_topic}"
  resource_group_name = var.resource_group_name
  location            = var.location
  source_arm_resource_id = var.source_id
  topic_type = var.topic_type ##"Microsoft.Storage.StorageAccounts"

}
 
resource "azurerm_eventgrid_event_subscription" "event_subs" {
  name                  = "ssna-storage-${terraform.workspace}-${var.event_subs}"
  scope                 = var.scope_id
  event_delivery_schema = var.event_schema
 
  included_event_types = [
    var.event_types
  ]
 
  webhook_endpoint {
   # url                  = "https.//${azurerm_linux_function_app.example.default_hostname}.azurewebsites.net"
    url                  = var.webhook_url
    }
}