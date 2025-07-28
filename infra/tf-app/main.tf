# Configure the Terraform runtime requirements.
terraform {
  required_version = ">= 1.1.0"

  required_providers {
    # Azure Resource Manager provider and version
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
    use_oidc             = true
  }
}

# Define providers and their config params
provider "azurerm" {
  # Leave the features block empty to accept all defaults
  features {}
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "mo10serek-a12-rg"
  location = "westus3"
}