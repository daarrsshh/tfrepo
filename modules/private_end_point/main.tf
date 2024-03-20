resource "azurerm_private_endpoint" "private_endpoint" {
  for_each            = local.association-map  #if var.blop_pep==true then execute below block
  name                = each.key
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  #tags                = var.tags
 
  private_service_connection {
    name                           = "${each.key}-private_service_connection"
    is_manual_connection           = var.is_manual_connection
    private_connection_resource_id = each.value.resource_key #var.private_connection_resource_id
    subresource_names              = each.value.subresource_name
  }
}

locals {
  association-map = merge([
    for resource, resource_id in var.resource_key : {
      for pep_key in var.private_endpoint_config :
        "${resource}-${pep_key}" => {
          "resource_key"   = resource_id
          "subresource_name" = [pep_key]
        }
    }
  ]...)
}
