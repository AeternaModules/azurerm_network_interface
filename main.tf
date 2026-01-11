resource "azurerm_network_interface" "network_interfaces" {
  for_each = var.network_interfaces

  location                       = each.value.location
  name                           = each.value.name
  resource_group_name            = each.value.resource_group_name
  accelerated_networking_enabled = each.value.accelerated_networking_enabled
  auxiliary_mode                 = each.value.auxiliary_mode
  auxiliary_sku                  = each.value.auxiliary_sku
  dns_servers                    = each.value.dns_servers
  edge_zone                      = each.value.edge_zone
  internal_dns_name_label        = each.value.internal_dns_name_label
  ip_forwarding_enabled          = each.value.ip_forwarding_enabled
  tags                           = each.value.tags

  ip_configuration {
    gateway_load_balancer_frontend_ip_configuration_id = each.value.ip_configuration.gateway_load_balancer_frontend_ip_configuration_id
    name                                               = each.value.ip_configuration.name
    primary                                            = each.value.ip_configuration.primary
    private_ip_address                                 = each.value.ip_configuration.private_ip_address
    private_ip_address_allocation                      = each.value.ip_configuration.private_ip_address_allocation
    private_ip_address_version                         = each.value.ip_configuration.private_ip_address_version
    public_ip_address_id                               = each.value.ip_configuration.public_ip_address_id
    subnet_id                                          = each.value.ip_configuration.subnet_id
  }
}

