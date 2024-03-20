#the product and location
location = "eastus"
product = "cca"
service = "func"
resource_group_name = "sitl-rg-prod-eus-cca"
#Application Insights Configuration
appinsights_config = {
    # appname = "tfsfuncappinsights"
    apptype = "web"
}

#App Service Plan Configuration
appservice_config = {
    # app_service_name = "tfsfuncappservice"
    os_type = "Linux"
    sku_name = "P1v3"
    zone_enable = true
    worker_count = null
    max_worker = null
}

#Storage Account Configuration
storage_acc_config ={ 
  "func" = {
    # storage_acc_name = "tfsfuncappstg"
    account_tier = "Standard"
    account_replication_type = "LRS"
    # pe_enable = true
    public_network_access_enabled = false
    versioning_enabled = true
    # allow_blob_public_access = true
}}

#Function App Configuration
func_app_config = {
  
  wftrigger = {
    # function_app_name= "tfsfunctionapptransverse"
    pyversion = "3.11"
    public_network_access_enabled = true
    ip_address={
      rule1={
        service_tag = "AzureEventGrid"
        priority = 100
        # ip_address = each.value.ip_address
        action = "Allow"
      }
    }
  },

  wfconfigure = {
    # function_app_name= "tfsfunctionapptransverse"
    pyversion = "3.11"
    public_network_access_enabled = false
    # ip_address = [["103.254.102.122"],["204.51.72.73"]]
    # ip_address = ["103.254.102.122"]
  }, 

  transcribe = {
    # function_app_name= "tfsfunctionapptransverse"
    pyversion = "3.11"
    public_network_access_enabled = false
    # ip_address = [["103.254.102.122"],["204.51.72.73"]]
    # ip_address = ["103.254.102.122"]
  },

  wfanalyse = {
    # function_app_name= "tfsfunctionapptransverse"
    pyversion = "3.11"
    public_network_access_enabled = false
    # ip_address = [["103.254.102.122"],["204.51.72.73"]]
    # ip_address = ["103.254.102.122"]
  },

  wfredact = {
    # function_app_name= "tfsfunctionapptransverse"
    pyversion = "3.11"
    public_network_access_enabled = false
    # ip_address = [["103.254.102.122"],["204.51.72.73"]]
    # ip_address = ["103.254.102.122"]
  },
  
  transcode = {
    # function_app_name= "tfsfunctionapptransverse"
    pyversion = "3.11"
    public_network_access_enabled = false
    LD_LIBRARY_PATH = "/home/site/wwwroot/audiowaveform"
    # ip_address = [["103.254.102.122"],["204.51.72.73"]]
    # ip_address = ["103.254.102.122"]
  }

}



#Private Endpoint Configuration
# private_endpoint_config = {

# sites={
#   is_manual_connection = false,
#   subresource_names = ["sites"]
  
# },
# blob={
#   is_manual_connection = false,
#   subresource_names = ["blob"]
# },
# file={
#   is_manual_connection = false,
#   subresource_names = ["file"]
# }
# }

# enable_sites_pep = true
# enable_blob_pep = true
# enable_file_pep = true
# enable_queue_pep = true
# enable_table_pep = true

#DNS Configuration/Time to Live
ttl = 300

# Loganalytics
log_name = "tfsloganalytics"
sku = "PerGB2018"
retention = "30"

private_dns_rg = "sitl-rg-hub-eus-cca"


subnet_id = "/subscriptions/48986b2e-5349-4fab-a6e8-d5f02072a4b8/resourceGroups/sitl-rg-prod-eus-cca-vnet/providers/Microsoft.Network/virtualNetworks/sitl-vnet-prod-eus-cca/subnets/sitl-snet-paas-prod-eus-cca"
outbound_subnet = "/subscriptions/48986b2e-5349-4fab-a6e8-d5f02072a4b8/resourceGroups/sitl-rg-prod-eus-cca-vnet/providers/Microsoft.Network/virtualNetworks/sitl-vnet-prod-eus-cca/subnets/sitl-snet-func-outbound-prod-eus-cca"
scope = "/subscriptions/48986b2e-5349-4fab-a6e8-d5f02072a4b8/resourceGroups/sitl-rg-prod-eus-cca"

link_name = "vnet_link"
private_dns_zone = "privatelink.azurewebsites.net"
private_dns_zone_storage = "privatelink.blob.core.windows.net"
private_dns_zone_storage_file = "privatelink.file.core.windows.net"
private_dns_zone_storage_queue = "privatelink.queue.core.windows.net"
private_dns_zone_storage_table = "privatelink.table.core.windows.net"
vnet_id = "/subscriptions/48986b2e-5349-4fab-a6e8-d5f02072a4b8/resourceGroups/sitl-rg-prod-eus-cca-vnet/providers/Microsoft.Network/virtualNetworks/sitl-vnet-prod-eus-cca"