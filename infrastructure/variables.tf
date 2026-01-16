variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-rpa-devops-simulated"
}

variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
  default     = "rpasimulatedstore"
}

variable "key_vault_name" {
  description = "Name of the Key Vault"
  type        = string
  default     = "kv-rpa-simulated"
}

variable "vm_size" {
  description = "Size of the Bot Runner VM"
  type        = string
  default     = "Standard_DS1_v2"
}

variable "admin_username" {
  description = "Admin username for VM"
  type        = string
  default     = "adminuser"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "simulated"
}