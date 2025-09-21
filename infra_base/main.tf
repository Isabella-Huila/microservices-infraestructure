terraform {
  backend "azurerm" {
    resource_group_name   = "rg-terraform"
    storage_account_name  = "mistorageisa"
    container_name        = "tfstate"
    key                   = "infra.terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Crear un grupo de recursos
resource "azurerm_resource_group" "rg" {
  name     = "microservices-rg"
  location = "East US"
}

# Crear un Azure Container Registry para almacenar las imágenes
resource "azurerm_container_registry" "acr" {
  name                = "miregistrounico"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  admin_enabled       = true
}

# Crear un entorno de Azure Container Apps
resource "azurerm_container_app_environment" "cae" {
  name                = "microservices-cae"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
