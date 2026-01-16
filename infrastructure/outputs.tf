output "resource_group_name" {
  description = "Resource group name"
  value       = azurerm_resource_group.rpa_rg.name
}

output "storage_account_name" {
  description = "Storage account name for bot artifacts"
  value       = azurerm_storage_account.rpa_storage.name
}

output "key_vault_name" {
  description = "Key Vault name for secrets"
  value       = azurerm_key_vault.rpa_kv.name
}

output "bot_runner_vm_name" {
  description = "Bot Runner VM name"
  value       = azurerm_windows_virtual_machine.bot_runner.name
}

output "bot_runner_private_ip" {
  description = "Bot Runner VM private IP address"
  value       = azurerm_network_interface.bot_runner_nic.private_ip_address
}

output "virtual_network_name" {
  description = "Virtual network name"
  value       = azurerm_virtual_network.bot_runner_vnet.name
}

output "infrastructure_status" {
  description = "Infrastructure provisioning status"
  value       = "All infrastructure components provisioned successfully (simulated)"
}