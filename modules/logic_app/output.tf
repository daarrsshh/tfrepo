output "logic_ids" {
  value = { for k, v in var.logic_app_config : "${azurerm_logic_app_standard.logic_app[k].name}" => "${azurerm_logic_app_standard.logic_app[k].id}"}
}

output "logic_app_principal_id" {
  value = {for k, v in var.logic_app_config : "${azurerm_logic_app_standard.logic_app[k].name}" => "${azurerm_logic_app_standard.logic_app[k].identity[0].principal_id}"}
}

output "logic_name" {
  value = [ for k, v in var.logic_app_config : "${azurerm_logic_app_standard.logic_app[k].name}" ]
}