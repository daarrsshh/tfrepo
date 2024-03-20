resource "azurerm_app_service_virtual_network_swift_connection" "vnetlink" {
  for_each            = var.vnet_integeration_config
  app_service_id = each.value
  subnet_id      = var.outbound_subnet
  lifecycle {
    ignore_changes = [ 
      subnet_id,
     ]
  }
}