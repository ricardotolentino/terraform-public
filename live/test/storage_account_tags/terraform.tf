terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.83.0"
    }
  }

  required_version = "~> 1.6"

  backend "azurerm" {
    subscription_id      = "7079b8ad-b4dc-4d12-92c0-b1efbf7f4f67"
    resource_group_name  = "terraform-state-rg-01"
    storage_account_name = "rttfstate01"
    container_name       = "tfstate"
    key                  = "storage-account-tags.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
