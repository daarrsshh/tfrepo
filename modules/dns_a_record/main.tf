resource "azurerm_private_dns_a_record" "A-record-blob" {
  for_each            =  {for k,v in var.dns_a_record_config : k => {
    "ip" = "${v.ip}"
    "subresource" = "${v.subresource}"
    } if v.subresource == "blob" } #lookup(values(var.dns_a_record_config.subresource),"blob")
  provider = azurerm.Hub
  name                = trimsuffix(each.key , "-blob")
  zone_name           = "privatelink.blob.core.windows.net"
  resource_group_name = var.private_dns_rg
  ttl                 = var.ttl
  
 
  # Retrieve storage account IP address
  records = [each.value.ip]
}

resource "azurerm_private_dns_a_record" "A-record-file" {
  for_each            =  {for k,v in var.dns_a_record_config : k => {
    "ip" = "${v.ip}"
    "subresource" = "${v.subresource}"
    } if v.subresource == "file" }
  name                =  trimsuffix(each.key, "-file")
  zone_name           = "privatelink.file.core.windows.net"
  resource_group_name = var.private_dns_rg
  ttl                 = var.ttl
  provider = azurerm.Hub
 
  # Retrieve storage account IP address
  records = [each.value.ip]
}


resource "azurerm_private_dns_a_record" "A-record-table" {
  for_each            =  {for k,v in var.dns_a_record_config : k => {
    "ip" = "${v.ip}"
    "subresource" = "${v.subresource}"
    } if v.subresource == "table" } #lookup(values(var.dns_a_record_config.subresource),"blob")
  provider = azurerm.Hub
  name                = trimsuffix(each.key , "-table")
  zone_name           = "privatelink.table.core.windows.net"
  resource_group_name = var.private_dns_rg
  ttl                 = var.ttl
  
 
  # Retrieve storage account IP address
  records = [each.value.ip]
}

resource "azurerm_private_dns_a_record" "A-record-queue" {
  for_each            =  {for k,v in var.dns_a_record_config : k => {
    "ip" = "${v.ip}"
    "subresource" = "${v.subresource}"
    } if v.subresource == "queue" } #lookup(values(var.dns_a_record_config.subresource),"blob")
  provider = azurerm.Hub
  name                = trimsuffix(each.key , "-queue")
  zone_name           = "privatelink.queue.core.windows.net"
  resource_group_name = var.private_dns_rg
  ttl                 = var.ttl
  
 
  # Retrieve storage account IP address
  records = [each.value.ip]
}



resource "azurerm_private_dns_a_record" "A-record-sites" {
  for_each            =  {for k,v in var.dns_a_record_config : k => {
    "ip" = "${v.ip}"
    "subresource" = "${v.subresource}"
    } if v.subresource == "sites" }
  name                = trimsuffix(each.key, "-sites")
  zone_name           = "privatelink.azurewebsites.net"
  resource_group_name = var.private_dns_rg
  ttl                 = var.ttl
  provider = azurerm.Hub
 
  # Retrieve storage account IP address
  records = [each.value.ip]
}

resource "azurerm_private_dns_a_record" "A-record-sites-scm" {
  for_each            =  {for k,v in var.dns_a_record_config : k => {
    "ip" = "${v.ip}"
    "subresource" = "${v.subresource}"
    } if v.subresource == "sites" }
  name                = "${trimsuffix(each.key, "-sites")}.scm"
  zone_name           = "privatelink.azurewebsites.net"
  resource_group_name = var.private_dns_rg
  ttl                 = var.ttl
  provider = azurerm.Hub
 
  # Retrieve storage account IP address
  records = [each.value.ip]
}

resource "azurerm_private_dns_a_record" "A-record-namespace" {
  for_each            =  {for k,v in var.dns_a_record_config : k => {
    "ip" = "${v.ip}"
    "subresource" = "${v.subresource}"
    } if v.subresource == "namespace" }
  name                = trimsuffix(each.key, "-namespace")
  zone_name           = "privatelink.servicebus.windows.net"
  resource_group_name = var.private_dns_rg
  ttl                 = var.ttl
  provider = azurerm.Hub
 
  # Retrieve storage account IP address
  records =[ each.value.ip]
}

resource "azurerm_private_dns_a_record" "A-record-account" {
  for_each            =  {for k,v in var.dns_a_record_config : k => {
    "ip" = "${v.ip}"
    "subresource" = "${v.subresource}"
    } if v.subresource == "account" }
  name                = trimsuffix(each.key, "-account")
  zone_name           = "privatelink.cognitiveservices.azure.com"
  resource_group_name = var.private_dns_rg
  ttl                 = var.ttl
  provider = azurerm.Hub
 
  # Retrieve storage account IP address
  records =[ each.value.ip]
}