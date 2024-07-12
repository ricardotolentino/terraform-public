resource "azurerm_resource_group" "rg" {
  provider = azurerm.mod_sub

  name     = "rg-${var.suffix}"
  location = var.location
  tags     = var.tags
}
