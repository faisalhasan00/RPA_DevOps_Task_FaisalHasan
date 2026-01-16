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

# Virtual Network for Bot Runner
resource "azurerm_virtual_network" "bot_runner_vnet" {
  name                = "vnet-rpa-simulated"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rpa_rg.location
  resource_group_name = azurerm_resource_group.rpa_rg.name
}

# Subnet for Bot Runner
resource "azurerm_subnet" "bot_runner_subnet" {
  name                 = "subnet-rpa-simulated"
  resource_group_name  = azurerm_resource_group.rpa_rg.name
  virtual_network_name = azurerm_virtual_network.bot_runner_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Network Interface for Bot Runner VM
resource "azurerm_network_interface" "bot_runner_nic" {
  name                = "nic-bot-runner-simulated"
  location            = azurerm_resource_group.rpa_rg.location
  resource_group_name = azurerm_resource_group.rpa_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.bot_runner_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Windows VM for Bot Runner (Control Room / Bot Runner environment)
resource "azurerm_windows_virtual_machine" "bot_runner" {
  name                = "vm-bot-runner-simulated"
  resource_group_name = azurerm_resource_group.rpa_rg.name
  location            = azurerm_resource_group.rpa_rg.location
  size                = "Standard_DS1_v2"
  admin_username      = "adminuser"
  admin_password      = "ComplexPassword123!" # Would be retrieved from Key Vault in production

  network_interface_ids = [
    azurerm_network_interface.bot_runner_nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  tags = {
    Environment = "simulated"
    Role        = "BotRunner"
    Purpose     = "Control Room / Bot Runner"
  }
}