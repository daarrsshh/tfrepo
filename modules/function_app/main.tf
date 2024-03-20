locals {
   region = var.location == "eastus" ? "eus" : "wus"
}


resource "azurerm_linux_function_app" "function-app" {
  for_each            = var.func_app_config
  name                = "ssna-func-${var.product}-${terraform.workspace}-${local.region}-${each.key}"
  location            = var.location
  resource_group_name = var.resource_group_name
 
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.primary_access_key
  service_plan_id            = var.app_service_id
  public_network_access_enabled = each.value.public_network_access_enabled

  #need to check from where to fetch value
  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY = var.instrumentation_key
    APPLICATIONINSIGHTS_CONNECTION_STRING =  var.connection_string
    ApplicationInsightsAgent_EXTENSION_VERSION = each.value.ApplicationInsightsAgent_EXTENSION_VERSION
    LD_LIBRARY_PATH = each.value.LD_LIBRARY_PATH

  }
 
  site_config {
    # ip_restriction {
    #   action = each.value.action
    #   # ip_address = each.value.ip_address
    # }

    # ip_restriction {
    #   action = each.value.action
    #   ip_address = each.value.ip_address2
    # }
    application_stack {
      python_version = each.value.pyversion
    }
    always_on = true


    dynamic "ip_restriction" {
      for_each = each.value.ip_address
      content {
        service_tag = each.value.service_tag
        priority = each.value.priority
        ip_address = each.value.ip_address
        action = each.value.action

      }
    }
  }

  identity {
    type = "SystemAssigned"
  }
}