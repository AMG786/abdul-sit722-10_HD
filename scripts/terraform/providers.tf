# Initializes Terraform providers and sets their version numbers.

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.71.0"
    }
  }
}

provider "azurerm" {
  features {}

  client_id       = "ff142118-5ade-4928-b774-530d31dff9b8"
  tenant_id       = "2625129d-99a2-4df5-988e-5c5d07e7d0fb"
  subscription_id = "0cd94adc-79e1-40a3-9dc0-5fc8b1990326"
}
