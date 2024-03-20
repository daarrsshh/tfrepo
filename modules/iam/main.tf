resource "azurerm_role_assignment" "role_assignment" {
  for_each = local.value
 
  principal_id         = each.value
  role_definition_name = var.role_definition_name
  scope                = var.scope
}
 
locals {
  value = var.resource_principal_id
}
