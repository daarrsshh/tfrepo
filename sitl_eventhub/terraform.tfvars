product = "cca"
#eventhub_namespace values
eventhub_namespace_config = {
#   namespace_name = "tfs-dev-ehub-space-sitl"
  sku = "Standard"
  capacity = "1"
  # public_network_access_enabled = false
}

#eventhub values
eventhub_config = {
#   eventhub_name = "tfs-dev-ehub-sitl"
  message_retention = 1
  partition_count = 2
}

#eventhub policy values
# eventhub-authorize= {
#     send={send = true},
#     listen={listen = true}
#     # policy_name = "tfs-dev-ehub-policy"
#     # send = true
#     # manage = false
#     # listen = false
# }

eventhub-authorize = {
  "send" = {
    send = true
    
  },
  "listen"= {
    listen =true
  }

}

#Role assignement and principal id
role = "Azure Event Hubs Data Owner"
pid = "7ef79aba-a7d3-4ef3-ac32-2d43d59876c4" #(can vary based on access given to the user)

#location
location = "eastus"
resource_group_name = "ssna-rg-cca-dev-eus"

#private endpoint configuration values

#Time to Live
ttl = 300

subnet_id = "/subscriptions/34b1c36e-d8e8-4bd5-a6f3-2f92a1c0626e/resourceGroups/ssna-rg-cca-dev-eus/providers/Microsoft.Network/virtualNetworks/ssna-vnet-dev-cca-eus/subnets/ssna-snet-dev-cca-eus-paas"
private_dns_rg = "ssna-rg-cca-dev-eus"

link_name = "eventhub_link"
private_dns_zone = "privatelink.servicebus.windows.net"
vnet_id = "/subscriptions/34b1c36e-d8e8-4bd5-a6f3-2f92a1c0626e/resourceGroups/ssna-rg-cca-dev-eus/providers/Microsoft.Network/virtualNetworks/ssna-vnet-dev-cca-eus"
