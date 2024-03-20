output "private_end_point_IP_address" {
  value = merge(local.blob_ips,local.file_ips,local.table_ips,local.queue_ips,local.sites_ips,local.namespace_ips)
  }

  locals {
    blob_ips = {for resource, resource_id in var.resource_key : "${resource}-blob" => {
      "ip" = "${azurerm_private_endpoint.private_endpoint_blob[resource].private_service_connection[0].private_ip_address}"
      "subresource" = "blob"
      } if var.enable_blob_pep == true
      
      }

    file_ips = {for resource, resource_id in var.resource_key : "${resource}-file" => {
      "ip" = "${azurerm_private_endpoint.private_endpoint_file[resource].private_service_connection[0].private_ip_address}"
      "subresource" = "file"
      } if var.enable_file_pep == true
      
      }

      sites_ips = {for resource, resource_id in var.resource_key : "${resource}-sites" => {
      "ip" = "${azurerm_private_endpoint.private_endpoint_sites[resource].private_service_connection[0].private_ip_address}"
      "subresource" = "sites"
      } if var.enable_sites_pep == true
      
      }

      namespace_ips = {for resource, resource_id in var.resource_key : "${resource}-namespace" => {
      "ip" = "${azurerm_private_endpoint.private_endpoint_namespace[resource].private_service_connection[0].private_ip_address}"
      "subresource" = "namespace"
      } if var.enable_namespace_pep == true
      
      }

      queue_ips = {for resource, resource_id in var.resource_key : "${resource}-queue" => {
      "ip" = "${azurerm_private_endpoint.private_endpoint_queue[resource].private_service_connection[0].private_ip_address}"
      "subresource" = "queue"
      } if var.enable_queue_pep == true
      
      }

      table_ips = {for resource, resource_id in var.resource_key : "${resource}-table" => {
      "ip" = "${azurerm_private_endpoint.private_endpoint_table[resource].private_service_connection[0].private_ip_address}"
      "subresource" = "table"
      } if var.enable_table_pep == true
      
      }

  }

