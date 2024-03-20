output "resource_id" {
    value = {"${azurerm_cognitive_account.stt.name}" = "${azurerm_cognitive_account.stt.id}"}
}

output "principal_id" {
    value = {"${azurerm_cognitive_account.stt.name}" = "${azurerm_cognitive_account.stt.identity[0].principal_id}"}
}