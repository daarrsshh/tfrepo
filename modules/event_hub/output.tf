output "resource_id" {
  value = {"${azurerm_eventhub_namespace.eventhub-namespace.name}" = "${azurerm_eventhub_namespace.eventhub-namespace.id}"}
}


# output "sas_key" {
#   value = "${azurerm_eventhub_authorization_rule.eventhub-authorize[k].primary_key}"
# }
output "sas_key" {
  value = {for k,v in var.eventhub-authorize : k => azurerm_eventhub_authorization_rule.eventhub-authorize[k].primary_connection_string}
  # sensitive = true
}