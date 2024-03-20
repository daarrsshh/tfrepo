#------------------------------------------
# Local Variabless
#------------------------------------------
locals {
  region = var.location == "eastus" ? "eastus" : "westus"
  loc_prefix  = var.location == "eastus" ? "eu" : "wu"
  region_hub  = var.location == "eastus" ? "eus" : "wus"
  product     = var.product
}
 
#------------------------------------------
# Remote State file for Resource Group
#------------------------------------------
data "terraform_remote_state" "privatedns" {
  backend = "azurerm"
  config = {
    resource_group_name = "tfs-rg-${terraform.workspace}-tfstate"
    storage_account_name = "tfsstg${terraform.workspace}tfstates"
    container_name       = "tfstate"
    key                  = "${local.region}/privatedns/${terraform.workspace}/default.tfstate"
  }
}
#---------------------------------------
# Resource group name outputs
#---------------------------------------
 
# output "web" {
#   value = data.terraform_remote_state.privatedns.outputs.dns_azurewebsite
#   description = "private dns zone name output for remotstate call"
# }

# output "eventhub" {
#   value = data.terraform_remote_state.privatedns.outputs.dns_eventhub
#   description = "private dns zone name output for remotstate call"
# }

# output "storage" {
#   value = data.terraform_remote_state.privatedns.outputs.dns_storage
#   description = "private dns zone name output for remotstate call"
# }

# output "file" {
#   value = data.terraform_remote_state.privatedns.outputs.dns_file
#   description = "private dns zone name output for remotstate call"
# }

output "rg_name" {
  value = data.terraform_remote_state.privatedns.outputs.rg
  description = "rg name output for remotstate call"
}
variable "location" {
  type = string
  description = "location of resources"
}
 
variable "product" {
  type = string
  description = "product name"
}