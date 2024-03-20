output "storageaccount_resource_id" {
    value = {for k,v in var.storage_acc_config : azurerm_storage_account.storageacc[k].name => azurerm_storage_account.storageacc[k].id}
}

output "storageaccount_resource_properties" {
    value = {for k,v in var.storage_acc_config : k => {
    name = azurerm_storage_account.storageacc[k].name
    id = azurerm_storage_account.storageacc[k].id
    key = azurerm_storage_account.storageacc[k].primary_access_key}}
}


output "storage_account_name" {
  value = [for k, v in var.storage_acc_config : azurerm_storage_account.storageacc[k].name]
}

output "storage_account_key" {
  value = [for k, v in var.storage_acc_config : azurerm_storage_account.storageacc[k].primary_access_key]
}
