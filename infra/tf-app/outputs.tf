output "resource_group_name" {
  value       = azurerm_resource_group.rg.name
  description = "The name of the resource group created."
}
output "vnet_id" {
  description = "The ID of the Virtual Network"
  value       = azurerm_virtual_network.main_vnet.id
}

output "subnet_id" {
  description = "The ID of the Subnet"
  value       = azurerm_subnet.main_subnet.id
}
