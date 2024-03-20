resource "azurerm_cognitive_account" "stt" {
  name                = "ssna-cogs-${var.product}-${terraform.workspace}-${var.location}"
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = var.kind # This is for multi-service account

  sku_name = var.sku_name

  public_network_access_enabled = var.access

  tags = {
    environment = "stt creation"
    terraformcreated = "yes"
  }

  identity {
    type = "SystemAssigned"
  }
  
  dynamic_throttling_enabled = var.throttle_enable

  custom_subdomain_name = "ssna-cogs-${var.product}-${terraform.workspace}-${var.location}"
}

resource "azurerm_role_assignment" "stt_role" {
  scope = azurerm_cognitive_account.stt.id
  role_definition_name = var.role
  principal_id = var.pid
}