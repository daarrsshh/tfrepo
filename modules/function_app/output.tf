output "function_app_id" {
  value = {for k, v in var.func_app_config : "${azurerm_linux_function_app.function-app[k].name}" => "${azurerm_linux_function_app.function-app[k].id}"}
}

output "function_app_principal_id" {
  value = {for k, v in var.func_app_config : "${azurerm_linux_function_app.function-app[k].name}" => "${azurerm_linux_function_app.function-app[k].identity[0].principal_id}"}
}
