resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.name_suffix}-${format("%04d", random_integer.rand_int.id)}"
  location = var.location
  tags     = {}
}
