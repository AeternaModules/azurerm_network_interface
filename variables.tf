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
  validation {
    condition = alltrue([
      for k, v in var.network_interfaces : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.network_interfaces : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.network_interfaces : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.network_interfaces : (
        alltrue([for item in v.ip_configuration : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.network_interfaces : (
        v.dns_servers == null || (alltrue([for x in v.dns_servers : length(x) > 0]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.network_interfaces : (
        v.edge_zone == null || (length(v.edge_zone) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.network_interfaces : (
        v.internal_dns_name_label == null || (length(v.internal_dns_name_label) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.network_interfaces : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 15 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

