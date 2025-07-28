# Configure the Terraform runtime requirements.
terraform {
  required_version = ">= 1.1.0"

  required_providers {
    # Azure Resource Manager provider and version
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "2.3.3"
    }
  }
}

# Define providers and their config params
provider "azurerm" {
  # Leave the features block empty to accept all defaults
  features {}
}

provider "cloudinit" {
  # Configuration options
}

output "arm_access_key" {
  value     = azurerm_storage_account.sa.primary_access_key
  sensitive = true
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "${var.label_prefix}-githubactions-rg"
  location = var.region
}

# Storage Account
resource "azurerm_storage_account" "sa" {
  name                     = "${var.label_prefix}githubactions" # must be globally unique, 3-24 lowercase letters/numbers
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
}

# Storage Container
resource "azurerm_storage_container" "container" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "container"
}