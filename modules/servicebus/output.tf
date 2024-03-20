output "resource_id" {
  value = {"${azurerm_servicebus_namespace.servicebus_namespace.name}" = "${azurerm_servicebus_namespace.servicebus_namespace.id}"}
}