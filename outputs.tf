output "network_interfaces_id" {
  description = "Map of id values across all network_interfaces, keyed the same as var.network_interfaces"
  value       = { for k, v in azurerm_network_interface.network_interfaces : k => v.id }
}
output "network_interfaces_accelerated_networking_enabled" {
  description = "Map of accelerated_networking_enabled values across all network_interfaces, keyed the same as var.network_interfaces"
  value       = { for k, v in azurerm_network_interface.network_interfaces : k => v.accelerated_networking_enabled }
}
output "network_interfaces_applied_dns_servers" {
  description = "Map of applied_dns_servers values across all network_interfaces, keyed the same as var.network_interfaces"
  value       = { for k, v in azurerm_network_interface.network_interfaces : k => v.applied_dns_servers }
}
output "network_interfaces_auxiliary_mode" {
  description = "Map of auxiliary_mode values across all network_interfaces, keyed the same as var.network_interfaces"
  value       = { for k, v in azurerm_network_interface.network_interfaces : k => v.auxiliary_mode }
}
output "network_interfaces_auxiliary_sku" {
  description = "Map of auxiliary_sku values across all network_interfaces, keyed the same as var.network_interfaces"
  value       = { for k, v in azurerm_network_interface.network_interfaces : k => v.auxiliary_sku }
}
output "network_interfaces_dns_servers" {
  description = "Map of dns_servers values across all network_interfaces, keyed the same as var.network_interfaces"
  value       = { for k, v in azurerm_network_interface.network_interfaces : k => v.dns_servers }
}
output "network_interfaces_edge_zone" {
  description = "Map of edge_zone values across all network_interfaces, keyed the same as var.network_interfaces"
  value       = { for k, v in azurerm_network_interface.network_interfaces : k => v.edge_zone }
}
output "network_interfaces_internal_dns_name_label" {
  description = "Map of internal_dns_name_label values across all network_interfaces, keyed the same as var.network_interfaces"
  value       = { for k, v in azurerm_network_interface.network_interfaces : k => v.internal_dns_name_label }
}
output "network_interfaces_internal_domain_name_suffix" {
  description = "Map of internal_domain_name_suffix values across all network_interfaces, keyed the same as var.network_interfaces"
  value       = { for k, v in azurerm_network_interface.network_interfaces : k => v.internal_domain_name_suffix }
}
output "network_interfaces_ip_configuration" {
  description = "Map of ip_configuration values across all network_interfaces, keyed the same as var.network_interfaces"
  value       = { for k, v in azurerm_network_interface.network_interfaces : k => v.ip_configuration }
}
output "network_interfaces_ip_forwarding_enabled" {
  description = "Map of ip_forwarding_enabled values across all network_interfaces, keyed the same as var.network_interfaces"
  value       = { for k, v in azurerm_network_interface.network_interfaces : k => v.ip_forwarding_enabled }
}
output "network_interfaces_location" {
  description = "Map of location values across all network_interfaces, keyed the same as var.network_interfaces"
  value       = { for k, v in azurerm_network_interface.network_interfaces : k => v.location }
}
output "network_interfaces_mac_address" {
  description = "Map of mac_address values across all network_interfaces, keyed the same as var.network_interfaces"
  value       = { for k, v in azurerm_network_interface.network_interfaces : k => v.mac_address }
}
output "network_interfaces_name" {
  description = "Map of name values across all network_interfaces, keyed the same as var.network_interfaces"
  value       = { for k, v in azurerm_network_interface.network_interfaces : k => v.name }
}
output "network_interfaces_private_ip_address" {
  description = "Map of private_ip_address values across all network_interfaces, keyed the same as var.network_interfaces"
  value       = { for k, v in azurerm_network_interface.network_interfaces : k => v.private_ip_address }
}
output "network_interfaces_private_ip_addresses" {
  description = "Map of private_ip_addresses values across all network_interfaces, keyed the same as var.network_interfaces"
  value       = { for k, v in azurerm_network_interface.network_interfaces : k => v.private_ip_addresses }
}
output "network_interfaces_resource_group_name" {
  description = "Map of resource_group_name values across all network_interfaces, keyed the same as var.network_interfaces"
  value       = { for k, v in azurerm_network_interface.network_interfaces : k => v.resource_group_name }
}
output "network_interfaces_tags" {
  description = "Map of tags values across all network_interfaces, keyed the same as var.network_interfaces"
  value       = { for k, v in azurerm_network_interface.network_interfaces : k => v.tags }
}
output "network_interfaces_virtual_machine_id" {
  description = "Map of virtual_machine_id values across all network_interfaces, keyed the same as var.network_interfaces"
  value       = { for k, v in azurerm_network_interface.network_interfaces : k => v.virtual_machine_id }
}

