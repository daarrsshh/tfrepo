locals {
  region = var.location == "eastus" ? "eastus" : "westus"
  product = var.product == "cca"
}

terraform {
  backend "azurerm" {
    resource_group_name = "ssna-rg-${terraform.workspace}-tfstate"
    storage_account_name = "ssnastg${terraform.workspace}tfstate"
    container_name = "tfstate"
    key = "${local.region}/${local.product}/loganalytics/${terraform.workspace}/default.tfstate"
  }
}