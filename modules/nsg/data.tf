data "azurerm_subnet" "subnets_nsg" {
  for_each = local.subnet_data_map
  provider = azurerm.mod_sub

  name                 = each.value.subnet
  virtual_network_name = each.value.vnet
  resource_group_name  = each.value.rg
}
