#Location
location = "eastus"
product = "cca"
resource_group_name = "sitl-rg-prod-eus-cca"
#Storage Account Configuration
storage_acc_config = { 
  
  "client" = {
        # storage_acc_name = "tfsstorageeusdars",
#       # account_tier = optional(string,"Standard"),
#       # account_replication_type = optional(string, "LRS"),
        public_network_access_enabled = false
        versioning_enabled = true

  }
}

#Private Endpoint Configuration


subnet_id = "/subscriptions/48986b2e-5349-4fab-a6e8-d5f02072a4b8/resourceGroups/sitl-rg-prod-eus-cca-vnet/providers/Microsoft.Network/virtualNetworks/sitl-vnet-prod-eus-cca/subnets/sitl-snet-paas-prod-eus-cca"
private_dns_rg = "sitl-rg-hub-eus-cca"

ttl = 300

#Event Subscription
# event_topic = "eventtopic"
# topic_type = "Microsoft.Storage.StorageAccounts"
# event_subs = "eventsubscription"
# event_schema = "EventGridSchema"
# event_types = "Microsoft.Storage.BlobCreated"
# webhook_url = "https://ssna-func-cca-dev-eus-wftrigger.azurewebsites.net/runtime/webhooks/EventGrid?functionName=EventGridTrigger&code=z02rzc_deqQ3sHCAT8JKorGnvpxlcg9L2OpIK4tEwn1FAzFuMDqB2g=="