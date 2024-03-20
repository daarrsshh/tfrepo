terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    #   version = "3.37.0"
    }
  }
}

provider "azurerm" {
    subscription_id = "48986b2e-5349-4fab-a6e8-d5f02072a4b8"
    tenant_id = "f8cd4990-6d46-448a-af3a-2c27c2bf1a28"
  features {}
}

provider "azurerm"{
  alias = "Hub"
  subscription_id = "34b1c36e-d8e8-4bd5-a6f3-2f92a1c0626e"
#   tenant_id = "f8cd4990-6d46-448a-af3a-2c27c2bf1a28"
  features {}
}