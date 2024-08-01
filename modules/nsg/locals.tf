locals {
  # Produces the flat map the subnet data resource will iterate over, where the map key is the string
  # "<RG>_<VNET>_<SUBNET>", and the map value is an object containing the RG, VNET, and subnet names.
  subnet_data_map = merge([for rg, vnets in var.subnet_map :
    merge([for vnet, subnets in vnets :
      { for subnet in subnets :
        "${rg}_${vnet}_${subnet}" => {
          rg     = rg,
          vnet   = vnet,
          subnet = subnet
        }
      }
    ]...)
  ]...)

  subnet_ids = [for k, v in local.subnet_data_map : data.azurerm_subnet.subnets_nsg[k].id]
}
