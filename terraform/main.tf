terraform {
  required_version = ">= 1.7.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.92"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }
  // use_cli should be set to false to yield more accurate error messages on auth failure.
  use_cli = false
  // use_oidc must be explicitly set to true when using multiple configurations.
  use_oidc             = true
  client_id_file_path  = var.tfc_azure_dynamic_credentials.default.client_id_file_path
  oidc_token_file_path = var.tfc_azure_dynamic_credentials.default.oidc_token_file_path
  subscription_id      = var.subscription_id
  tenant_id            = var.tenant_id
}

resource "azurerm_resource_group" "backstage" {
  name     = "backstage-rg"
  location = "japaneast"
}