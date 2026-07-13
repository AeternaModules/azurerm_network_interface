variable "network_interfaces" {
  description = <<EOT
Map of network_interfaces, attributes below
Required:
    - location
    - name
    - resource_group_name
    - ip_configuration (block):
        - gateway_load_balancer_frontend_ip_configuration_id (optional)
        - name (required)
        - primary (optional)
        - private_ip_address (optional)
        - private_ip_address_allocation (required)
        - private_ip_address_version (optional)
        - public_ip_address_id (optional)
        - subnet_id (optional)
Optional:
    - accelerated_networking_enabled
    - auxiliary_mode
    - auxiliary_sku
    - dns_servers
    - edge_zone
    - internal_dns_name_label
    - ip_forwarding_enabled
    - tags
EOT

  type = map(object({
    location                       = string
    name                           = string
    resource_group_name            = string
    accelerated_networking_enabled = optional(bool)
    auxiliary_mode                 = optional(string)
    auxiliary_sku                  = optional(string)
    dns_servers                    = optional(list(string))
    edge_zone                      = optional(string)
    internal_dns_name_label        = optional(string)
    ip_forwarding_enabled          = optional(bool)
    tags                           = optional(map(string))
    ip_configuration = list(object({
      gateway_load_balancer_frontend_ip_configuration_id = optional(string)
      name                                               = string
      primary                                            = optional(bool)
      private_ip_address                                 = optional(string)
      private_ip_address_allocation                      = string
      private_ip_address_version                         = optional(string)
      public_ip_address_id                               = optional(string)
      subnet_id                                          = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.network_interfaces : (
        length(v.ip_configuration) >= 1
      )
    ])
    error_message = "Each ip_configuration list must contain at least 1 items"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_network_interface's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: ip_configuration.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: ip_configuration.subnet_id
  #   source:    [from commonids.ValidateSubnetID] !ok
  # path: ip_configuration.subnet_id
  #   source:    [from commonids.ValidateSubnetID] err != nil
  # path: ip_configuration.private_ip_address_version
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: ip_configuration.private_ip_address_allocation
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: ip_configuration.public_ip_address_id
  #   source:    [from commonids.ValidatePublicIPAddressID] !ok
  # path: ip_configuration.public_ip_address_id
  #   source:    [from commonids.ValidatePublicIPAddressID] err != nil
  # path: ip_configuration.gateway_load_balancer_frontend_ip_configuration_id
  #   source:    [from lbvalidate.LoadBalancerFrontendIpConfigurationID] !ok
  # path: ip_configuration.gateway_load_balancer_frontend_ip_configuration_id
  #   source:    [from lbvalidate.LoadBalancerFrontendIpConfigurationID] err != nil
  # path: auxiliary_mode
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: auxiliary_sku
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: dns_servers[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: edge_zone
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: internal_dns_name_label
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

