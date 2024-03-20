resource "azurerm_servicebus_namespace" "servicebus_namespace" {
  name                = "ssna-sbns-${var.product}-${terraform.workspace}-${var.location}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  premium_messaging_partitions = 1
  capacity = 1
  zone_redundant = true

  network_rule_set {
    trusted_services_allowed = var.trusted_services_allowed
    # public_network_access_enabled = var.servicebus_public_network_access_enabled
  }
  
  tags = {
    Terraform_created = "yes"
  }

  public_network_access_enabled = var.servicebus_public_network_access_enabled
}

resource "azurerm_servicebus_topic" "servicebus_topic" {
  name         = "ssna-${var.product}-${terraform.workspace}-content"
  namespace_id = azurerm_servicebus_namespace.servicebus_namespace.id
  default_message_ttl = "P7D"
  auto_delete_on_idle = "P7D"
  requires_duplicate_detection = true
  duplicate_detection_history_time_window = "P1D"
  max_size_in_megabytes = "81920"

  enable_partitioning = true #recommended as true

  depends_on = [ azurerm_servicebus_namespace.servicebus_namespace ]
}

resource "azurerm_servicebus_subscription" "servicebus_subscription" {
  name               = "ssna-sbts-${var.product}-${terraform.workspace}-${var.location}"
  topic_id           = azurerm_servicebus_topic.servicebus_topic.id
  max_delivery_count = 100

  default_message_ttl = "P7D"

  auto_delete_on_idle = "P7D"
  dead_lettering_on_message_expiration = true
  dead_lettering_on_filter_evaluation_error = false
  # lock_duration = 1

  depends_on = [ azurerm_servicebus_namespace.servicebus_namespace, azurerm_servicebus_topic.servicebus_topic ]
  
}

resource "azurerm_role_assignment" "servicebus_role" {
    scope                = azurerm_servicebus_namespace.servicebus_namespace.id
    role_definition_name = var.role
    principal_id         =  var.pid
}