terraform {
  required_version = ">= 1.1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.64.0"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "2.3.3"
    }
  }

  backend "azurerm" {
    resource_group_name  = "mo10serek-githubactions-rg"
    storage_account_name = "mo10serekgithubactions"
    container_name       = "tfstate"
    key                  = "prod.app.tfstate"
  }
}

provider "azurerm" {
  features {}
  use_oidc                     = true
  skip_provider_registration   = true
}

resource "azurerm_resource_group" "rg" {
  name     = "mo10serek-a12-rg"
  location = "westus3"
}

output "resource_group_name" {
  description = "The name of the resource group created"
  value       = azurerm_resource_group.rg.name
}
