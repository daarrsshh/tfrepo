 resource "azurerm_private_dns_zone_virtual_network_link" "dns-vlink" {
   provider = azurerm.Hub
   name                  = var.link_name
   resource_group_name   = var.private_dns_rg
   private_dns_zone_name = var.private_dns_zone
   virtual_network_id    = var.vnet_id
   registration_enabled = var.registration_enabled
 }