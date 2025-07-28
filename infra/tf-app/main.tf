# Configure the Terraform runtime requirements.
terraform {
  required_version = ">= 1.1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.64.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "${var.label_prefix}-githubactions-rg"
    storage_account_name = "${var.label_prefix}githubactions"
    container_name       = "tfstate"
    key                  = "prod.app.tfstate"
  }
}

provider "azurerm" {
  features {}
  use_oidc                   = true
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.label_prefix}-a12-rg"
  location = var.region
}
