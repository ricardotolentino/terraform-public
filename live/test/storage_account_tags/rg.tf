resource "azurerm_resource_group" "rg" {
  name     = "rg-test"
  location = local.location
  tags     = {}
}
