#------------------------------------------
# Local Variabless
#------------------------------------------

locals {
    region = var.location == "eastus" ? "eastus" : "westus"
    loc_prefix = var.location == "eastus" ? "eus" : "wus"
    region_hub = var.location == "eastus" ? "eus" : "wus"
    product = var.product == "cca"
}

#------------------------------------------
# Remote State file for Subnet
#------------------------------------------

data "terraform_remote_state" "loganalytics" {
    backend = "azurerm"
    config = {
        resource_group_name = "ssna-rg-${terraform.workspace}-tfstate"
        storage_account_name = "ssnastg${terraform.workspace}tfstate"
        container_name= "tfstate"
        key = "${local.region}/${local.product}/loganalytics/${terraform.workspace}/default.tfstateenv:${terraform.workspace}"
        }
}

#------------------------------------------
# Output of loganalytics
#------------------------------------------
output "workspace_id" {
    value = data.terraform_remote_state.loganalytics.outputs.loganalytics_id
}

variable "location" {
    type = string
    description = "location of resources"
}

variable "product" {
    type = string
    description = "product name"
}