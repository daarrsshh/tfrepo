module "loganalytics" {
  source = "../modules/loganalytics"

  location = var.location
  product = var.product
  resource_group_name = var.resource_group_name
  retention = var.retention
  sku = var.sku
}