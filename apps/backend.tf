terraform {
  backend "azurerm" {
    resource_group_name   = "rg-terraform"
    storage_account_name  = "mistorageisa"
    container_name        = "tfstate"
    key                   = "apps.terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}