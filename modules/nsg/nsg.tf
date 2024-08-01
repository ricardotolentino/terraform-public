resource "azurerm_network_security_group" "nsg" {
  provider = azurerm.mod_sub

  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  security_rule = var.security_rule
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  for_each = toset(local.subnet_ids)
  provider = azurerm.mod_sub

  subnet_id                 = each.key
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_management_lock" "lock_nsg" {
  name       = "nsg_lock"
  scope      = azurerm_network_security_group.nsg.id
  lock_level = "ReadOnly"
}
