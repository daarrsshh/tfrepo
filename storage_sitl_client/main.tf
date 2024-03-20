module "storage_acc" {
    source = "../modules/storage_account"
    resource_group_name = var.resource_group_name
    location = var.location
    storage_acc_config = var.storage_acc_config
    product = var.product
  
}

module "private_endpoint" {
    source = "../modules/private_end_point"
    private_endpoint_config = ["blob","file","queue","table"]
    is_manual_connection = false
    resource_group_name = var.resource_group_name
    location = var.location
    resource_key = module.storage_acc.storageaccount_resource_id
    subnet_id = var.subnet_id
}


module "dns_a_record" {
    source = "../modules/dns_a_record"
    private_dns_rg = var.private_dns_rg
    dns_a_record_config = module.private_endpoint.private_end_point_IP_address
    ttl = var.ttl
  
}

# module "storage_event_subscription" {
#   source = "../modules/event_subscription"

#   event_topic = var.event_topic
#   resource_group_name = var.resource_group_name
#   location = var.location
#   topic_type = var.topic_type
#   source_id = module.storage_acc.storageaccount_resource_id["ssnastccadeveastusclient"]
#   scope_id = module.storage_acc.storageaccount_resource_id["ssnastccadeveastusclient"]
#   event_schema = var.event_schema
#   event_types = var.event_types
#   event_subs = var.event_subs
#   webhook_url = var.webhook_url
# }