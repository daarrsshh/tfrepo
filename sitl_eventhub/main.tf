module "eventhub" {
  source = "../modules/event_hub"
  eventhub_config = var.eventhub_config
  eventhub-authorize = var.eventhub-authorize
  eventhub_namespace_config = var.eventhub_namespace_config
  resource_group_name = var.resource_group_name
  location = var.location
  role = var.role
  pid = var.pid
  product = var.product

}

module "privateendpoint" {
    source = "../modules/private_end_point"
    private_endpoint_config = ["namespace"]
    is_manual_connection = false
    resource_group_name = var.resource_group_name
    location = var.location
    resource_key = module.eventhub.resource_id
    subnet_id = var.subnet_id
}

module "dns-a-record" {
    source = "../modules/dns_a_record"
    private_dns_rg = var.private_dns_rg
    dns_a_record_config = module.privateendpoint.private_end_point_IP_address 
    ttl = var.ttl
}

module "dns_vnet_link" {
  source = "../modules/vnet_linking"

  link_name = var.link_name
  private_dns_rg = var.private_dns_rg
  private_dns_zone = var.private_dns_zone
  vnet_id = var.vnet_id
  registration_enabled =var.registration_enabled

}