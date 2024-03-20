#naming to be confirmed
resource "azurerm_eventhub_namespace" "eventhub-namespace" {
#   for_each = var.eventhub_namespace_config
  name                = "ssna-eventhubnamespace-${var.product}-${terraform.workspace}-${var.location}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.eventhub_namespace_config.sku
  capacity            = var.eventhub_namespace_config.capacity
  public_network_access_enabled = var.eventhub_ns_public_network_access_enabled
}
resource "azurerm_eventhub" "eventhub" {
#   for_each =  var.eventhub-config
  name                = "ssna-eventhub-${var.product}"
  namespace_name      = "ssna-eventhubnamespace-${var.product}-${terraform.workspace}-${var.location}"
  resource_group_name = var.resource_group_name
  partition_count     = var.eventhub_config.partition_count
  message_retention   = var.eventhub_config.message_retention

  depends_on = [ azurerm_eventhub_namespace.eventhub-namespace]
}
#Event hub Policy creation
resource "azurerm_eventhub_authorization_rule" "eventhub-authorize" {
#   for_each = var.enable_ehub == true ? var.authorize_rule[terraform.workspace] : {}
  for_each = var.eventhub-authorize
  name                = "ssna-eventhub-${var.product}-${terraform.workspace}-${var.location}-${each.key}-policy"
  namespace_name      = "ssna-eventhubnamespace-${var.product}-${terraform.workspace}-${var.location}"
  eventhub_name       = "ssna-eventhub-${var.product}"
  resource_group_name = var.resource_group_name
  listen              = each.value.listen
  send                = each.value.send
  manage              = each.value.manage

  depends_on = [ azurerm_eventhub_namespace.eventhub-namespace, azurerm_eventhub.eventhub ]
}

# Service Prinicipal Assignment
resource "azurerm_role_assignment" "pod-identity-assignment" {
#    for_each            = var.env[terraform.workspace]
  scope                = azurerm_eventhub_namespace.eventhub-namespace.id
  role_definition_name = var.role
  principal_id         =  var.pid

  depends_on = [ azurerm_eventhub_namespace.eventhub-namespace ]
}