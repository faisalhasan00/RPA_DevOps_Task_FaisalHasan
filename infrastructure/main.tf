terraform {
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

resource "azurerm_resource_group" "rpa_rg" {
  name     = "rg-rpa-devops-simulated"
  location = "East US"
}

resource "azurerm_storage_account" "rpa_storage" {
  name                     = "rpasimulatedstore"
  resource_group_name      = azurerm_resource_group.rpa_rg.name
  location                 = azurerm_resource_group.rpa_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_key_vault" "rpa_kv" {
  name                = "kv-rpa-simulated"
  location            = azurerm_resource_group.rpa_rg.location
  resource_group_name = azurerm_resource_group.rpa_rg.name
  tenant_id           = "00000000-0000-0000-0000-000000000000"
  sku_name            = "standard"
}
