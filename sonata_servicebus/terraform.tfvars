location = "eastus"
product = "cca"
resource_group_name = "sitl-rg-prod-eus-cca"
sku = "Premium"

role = "Azure Service Bus Data Receiver"
pid = "9afb82b8-0b71-4ea5-bc4b-73fea72c00d7" #(can vary based on access given to the user)

servicebus_public_network_access_enabled =false

#private endpoint configuration values

#Time to Live
ttl = 300

subnet_id = "/subscriptions/48986b2e-5349-4fab-a6e8-d5f02072a4b8/resourceGroups/sitl-rg-prod-eus-cca-vnet/providers/Microsoft.Network/virtualNetworks/sitl-vnet-prod-eus-cca/subnets/sitl-snet-paas-prod-eus-cca"
private_dns_rg = "sitl-rg-hub-eus-cca"

link_name = "dns_vnet_link"
private_dns_zone = "privatelink.servicebus.windows.net"
vnet_id = "/subscriptions/48986b2e-5349-4fab-a6e8-d5f02072a4b8/resourceGroups/sitl-rg-prod-eus-cca-vnet/providers/Microsoft.Network/virtualNetworks/sitl-vnet-prod-eus-cca"