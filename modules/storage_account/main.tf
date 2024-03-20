locals {
   region = var.location == "eastus" ? "eus" : "wus"
}

resource "azurerm_storage_account" "storageacc" {
  for_each = var.storage_acc_config
  resource_group_name      = var.resource_group_name
  location                 = var.location

  name                     = "ssnast${var.product}${terraform.workspace}${local.region}${each.key}" 
   #each.value. #tfsdevccaeusloghicapp
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
  allow_nested_items_to_be_public = each.value.allow_blob_public_access


  blob_properties {
    versioning_enabled = each.value.versioning_enabled
  } 
  


 #disabling public access over internet
  public_network_access_enabled = each.value.public_network_access_enabled

  network_rules {
    default_action             = each.value.networkrules_defaultaction
    ip_rules                   = each.value.ip_rules
    # virtual_network_subnet_ids = [azurerm_subnet.example.id]
  }
    
}

