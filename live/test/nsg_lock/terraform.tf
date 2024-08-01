terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.111.0"
    }
  }

  required_version = "~> 1.9"

  backend "azurerm" {
    subscription_id      = "7079b8ad-b4dc-4d12-92c0-b1efbf7f4f67"
    resource_group_name  = "terraform-state-rg-01"
    storage_account_name = "rttfstate01"
    container_name       = "tfstate"
    key                  = "test-public-nsglock.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

provider "random" {}

provider "azurerm" {
  subscription_id = "7079b8ad-b4dc-4d12-92c0-b1efbf7f4f67"
  alias           = "payg"

  features {}
  skip_provider_registration = true
}
