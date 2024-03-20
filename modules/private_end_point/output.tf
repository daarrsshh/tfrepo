output "private_end_point_IP_address" {
  value = local.ips
  }

  locals {
    ips = {for k,s in local.association-map : "${k}" => {
      "ip" = "${azurerm_private_endpoint.private_endpoint["${k}"].private_service_connection[0].private_ip_address}"
      "subresource" = "${azurerm_private_endpoint.private_endpoint["${k}"].private_service_connection[0].subresource_names[0]}"
      }
      
      }

  }

