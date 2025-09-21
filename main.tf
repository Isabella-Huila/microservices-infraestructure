terraform {
  backend "azurerm" {
    resource_group_name   = "rg-terraform"
    storage_account_name  = "terraformstate12345"
    container_name        = "tfstate"
    key                   = "infra.terraform.tfstate"
  }
}