variable "location" {
  description = "This is the location where the resources will be provisioned (Example, westus2, eastus2, etc...)."
  type        = string
}

variable "name" {
  description = "The name for the Network Security Group."
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group where the resource(s) will be provisioned."
  type        = string
}

variable "security_rule" {
  description = "List of security rules for the Network Security Group."
  type = list(object(
    {
      access                                     = string
      description                                = string
      destination_address_prefix                 = string
      destination_address_prefixes               = list(string)
      destination_application_security_group_ids = list(string)
      destination_port_range                     = string
      destination_port_ranges                    = list(string)
      direction                                  = string
      name                                       = string
      priority                                   = number
      protocol                                   = string
      source_address_prefix                      = string
      source_address_prefixes                    = list(string)
      source_application_security_group_ids      = list(string)
      source_port_range                          = string
      source_port_ranges                         = list(string)
    }
  ))
  default = []
}

variable "subnet_map" {
  description = "Map of Resource Groups, VNets, and subnets to associate with the Network Security Group."
  type        = map(map(list(string)))
  default     = {}
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
