locals {
   region = var.location == "eastus" ? "eus" : "wus"
}
resource "azurerm_logic_app_standard" "logic_app" {
  for_each                   = var.logic_app_config
  name                       = "ssna-logicapp-${var.product}-${terraform.workspace}-${var.location}"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = var.lg_app_service_id
  storage_account_name       = var.lg_storage_account_name
  storage_account_access_key = var.lg_primary_access_key
  version = "~4"
  https_only = true
  
  
  site_config{
    # always_on = true
    public_network_access_enabled = each.value.public_network_access_enabled
    use_32_bit_worker_process = false
    vnet_route_all_enabled = "1"
    # ip_restriction = each.value.ip_address
    
  }

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME"     = each.value.FUNCTIONS_WORKER_RUNTIME
    "WEBSITE_NODE_DEFAULT_VERSION" = each.value.WEBSITE_NODE_DEFAULT_VERSION
    "APPINSIGHTS_INSTRUMENTATIONKEY" =  var.connection_string
    "WEBSITE_VNET_ROUTE_ALL"= "1"
    "WEBSITE_CONTENTOVERVNET"= "1"
    "AzureBlob_blobStorageEndpoint" = "https://ssnast${var.product}${terraform.workspace}${local.region}client.blob.core.windows.net"
    "serviceBus_fullyQualifiedNamespace" = "ssna-sbns-${var.product}-${terraform.workspace}-${var.location}.servicebus.windows.net"
    # "eventHub_connectionString" = var.eventHub_connectionString
    # "Smtp_enableSSL" = "${each.value.Smtp_enableSSL}"
    # "Smtp_password" = "${each.value.Smtp_password}"
    # "Smtp_port" = "${each.value.Smtp_port}"
    # "Smtp_serverAddress" = "${each.value.Smtp_serverAddress}"
    # "Smtp_username" = "${each.value.Smtp_username}"
  }

  identity {
    type = "SystemAssigned"
  }
  
}




# app_settings = {
  #   "FUNCTIONS_WORKER_RUNTIME"     = "node"#"${each.value.FUNCTIONS_WORKER_RUNTIME}"
  #   "WEBSITE_NODE_DEFAULT_VERSION" = "~4" #"${each.value.WEBSITE_NODE_DEFAULT_VERSION}"
  #   "FUNCTIONS_EXTENSION_VERSION" = "~18" #"${each.value.FUNCTIONS_EXTENSION_VERSION}"
  #   # "APP_KIND" = "${each.value.APP_KIND}"
  #   "AzureBlob_blobStorageEndpoint" = "https://sitlst${var.product}${terraform.workspace}${var.location}client.blob.core.windows.net"
  #   # "eventHub_connectionString" = var.eventHub_connectionString
  #   # "Smtp_enableSSL" = "${each.value.Smtp_enableSSL}"
  #   # "Smtp_password" = "${each.value.Smtp_password}"
  #   # "Smtp_port" = "${each.value.Smtp_port}"
  #   # "Smtp_serverAddress" = "${each.value.Smtp_serverAddress}"
  #   # "Smtp_username" = "${each.value.Smtp_username}"
  # }