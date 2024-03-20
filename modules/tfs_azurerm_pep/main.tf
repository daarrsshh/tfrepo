resource "azurerm_private_endpoint" "private_endpoint_blob" {
  for_each            ={ for resource, resource_id in var.resource_key : resource => resource_id if var.enable_blob_pep == true}
    

  
  name                = "${each.key}-blob"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  #tags                = var.tags
 
  private_service_connection {
    name                           = "${each.key}-blob-private_service_connection"
    is_manual_connection           = var.is_manual_connection
    private_connection_resource_id = each.value #var.private_connection_resource_id
    subresource_names              = ["blob"]
  }
}

resource "azurerm_private_endpoint" "private_endpoint_file" {
  for_each            ={ for resource, resource_id in var.resource_key : resource => resource_id if var.enable_file_pep == true}

  name                = "${each.key}-file"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  #tags                = var.tags
 
  private_service_connection {
    name                           = "${each.key}-file-private_service_connection"
    is_manual_connection           = var.is_manual_connection
    private_connection_resource_id = each.value #var.private_connection_resource_id
    subresource_names              = ["file"]
  }
}



resource "azurerm_private_endpoint" "private_endpoint_queue" {
  for_each            ={ for resource, resource_id in var.resource_key : resource => resource_id if var.enable_queue_pep == true}
    

  
  name                = "${each.key}-queue"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  #tags                = var.tags
 
  private_service_connection {
    name                           = "${each.key}-queue-private_service_connection"
    is_manual_connection           = var.is_manual_connection
    private_connection_resource_id = each.value #var.private_connection_resource_id
    subresource_names              = ["queue"]
  }
}

resource "azurerm_private_endpoint" "private_endpoint_table" {
  for_each            ={ for resource, resource_id in var.resource_key : resource => resource_id if var.enable_table_pep == true}
    

  
  name                = "${each.key}-table"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  #tags                = var.tags
 
  private_service_connection {
    name                           = "${each.key}-table-private_service_connection"
    is_manual_connection           = var.is_manual_connection
    private_connection_resource_id = each.value #var.private_connection_resource_id
    subresource_names              = ["table"]
  }
}





resource "azurerm_private_endpoint" "private_endpoint_sites" {
  for_each            ={ for resource, resource_id in var.resource_key : resource => resource_id if var.enable_sites_pep == true}

  name                = "${each.key}-sites"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  #tags                = var.tags
 
  private_service_connection {
    name                           = "${each.key}-sites-private_service_connection"
    is_manual_connection           = var.is_manual_connection
    private_connection_resource_id = each.value #var.private_connection_resource_id
    subresource_names              = ["sites"]
  }
}


resource "azurerm_private_endpoint" "private_endpoint_namespace" {
  for_each            ={ for resource, resource_id in var.resource_key : resource => resource_id if var.enable_namespace_pep == true}

  name                = "${each.key}-namespace"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id
  #tags                = var.tags
 
  private_service_connection {
    name                           = "${each.key}-namespace-private_service_connection"
    is_manual_connection           = var.is_manual_connection
    private_connection_resource_id = each.value #var.private_connection_resource_id
    subresource_names              = ["namespace"]
  }
}

# resource "azurerm_private_endpoint" "private_endpoint_file" {
#   for_each            = merge([
#     for resource, resource_id in var.resource_key : {
#       for pep_key, pep_value in var.private_endpoint_config :
#         "${resource}-file" => {
#           "resource_key"   = resource_id
#           "is_manual_connection" = pep_value.is_manual_connection
#           # "subresource_name" = pep_value.subresource_names
#         } if var.enable_file_pep == true
#     } 
#   ]...) 
  
#   name                = "${each.key}-file"
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   subnet_id           = var.subnet_id
#   #tags                = var.tags
 
#   private_service_connection {
#     name                           = "${each.key}-file-private_service_connection"
#     is_manual_connection           = each.value.is_manual_connection
#     private_connection_resource_id = each.value.resource_key #var.private_connection_resource_id
#     subresource_names              = ["file"]
#   }
# }


# resource "azurerm_private_endpoint" "private_endpoint_sites" {
#   for_each            = merge([
#     for resource, resource_id in var.resource_key : {
#       for pep_key, pep_value in var.private_endpoint_config :
#         "${resource}-sites" => {
#           "resource_key"   = resource_id
#           "is_manual_connection" = pep_value.is_manual_connection
#           # "subresource_name" = pep_value.subresource_names
#         } if var.enable_sites_pep == true
#     } 
#   ]...) 
  
#   name                = "${each.key}-sites"
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   subnet_id           = var.subnet_id
#   #tags                = var.tags
 
#   private_service_connection {
#     name                           = "${each.key}-sites-private_service_connection"
#     is_manual_connection           = each.value.is_manual_connection
#     private_connection_resource_id = each.value.resource_key #var.private_connection_resource_id
#     subresource_names              = ["sites"]
#   }
# }


# resource "azurerm_private_endpoint" "private_endpoint_namespace" {
#   for_each            = merge([
#     for resource, resource_id in var.resource_key : {
#       for pep_key, pep_value in var.private_endpoint_config :
#         "${resource}-namespace" => {
#           "resource_key"   = resource_id
#           "is_manual_connection" = pep_value.is_manual_connection
#           # "subresource_name" = pep_value.subresource_names
#         } if var.enable_namespace_pep == true
#     } 
#   ]...) 
  
#   name                = "${each.key}-namespace"
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   subnet_id           = var.subnet_id
#   #tags                = var.tags
 
#   private_service_connection {
#     name                           = "${each.key}-namespace-private_service_connection"
#     is_manual_connection           = each.value.is_manual_connection
#     private_connection_resource_id = each.value.resource_key #var.private_connection_resource_id
#     subresource_names              = ["namespace"]
#   }
# }

# # locals {
# #   association-map = merge([
# #     for resource, resource_id in var.resource_key : {
# #       for pep_key, pep_value in var.private_endpoint_config :
# #         "${resource}" => {
# #           "resource_key"   = resource_id
# #           "is_manual_connection" = pep_value.is_manual_connection
# #           # "subresource_name" = pep_value.subresource_names
# #         }
# #     }
# #   ]...)
# # }

