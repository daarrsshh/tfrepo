module "stt" {
  source = "../modules/az_stt"

  location = var.location
  resource_group_name = var.resource_group_name
  kind = var.kind
  # custom_name = var.custom_name
  sku_name = var.sku_name
  role = var.role
  pid = var.pid
  product = var.product
}

module "privateendpoint" {
    source = "../modules/private_end_point"
    private_endpoint_config = ["account"]
    is_manual_connection = false
    resource_group_name = var.resource_group_name
    location = var.location
    resource_key = module.stt.resource_id
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

module "IAM" {
    source = "../modules/iam"
  resource_principal_id = module.stt.principal_id
  scope = var.scope
  role_definition_name = "storage blob data contributor"
}