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
data "terraform_remote_state" "subnet" {
  backend = "azurerm"
  config = {
    resource_group_name  = "tfs-rg-${terraform.workspace}-tfstate"
    storage_account_name = "tfsstg${terraform.workspace}tfstates"
    container_name       = "tfstate"
    key                  = "${local.region}/subnet/${terraform.workspace}/default.tfstate"
 
  }
}
#------------------------------------------
# Output of subnets
#------------------------------------------
 output "private_endpoint_subnet" {
  value = data.terraform_remote_state.subnet.outputs["subnet_id1"]
  description = "inbound subnet id output for remotstate call"
}

 output "outbound_subnet" {
  value = data.terraform_remote_state.subnet.outputs["subnet_id2"]
  description = "function app outbound subnet id output for remotstate call"
}

 output "outbound_subnet_logic" {
  value = data.terraform_remote_state.subnet.outputs["subnet_id3"]
  description = "logic app outbound subnet id output for remotstate call"
}

variable "location" {
  type = string
  description = "location of resources"
}
 
variable "product" {
  type = string
  description = "product name"
}