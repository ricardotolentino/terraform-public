resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.name_suffix}-${format("%04d", random_integer.rand_int.id)}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  tags                = {}

  address_space = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet_test1" {
  name                 = "snet-test1"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_subnet" "subnet_test2" {
  name                 = "snet-test2"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
