module "nsg_test2" {
  source = "../../../modules/nsg"
  providers = {
    azurerm.mod_sub = azurerm.payg
  }

  name                = "nsg-test2-${format("%04d", random_integer.rand_int.id)}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = "eastus2"
  tags                = {}
  subnet_map          = {}
  security_rule = [
    {
      access                                     = "Allow"
      description                                = ""
      destination_address_prefix                 = "*"
      destination_address_prefixes               = []
      destination_application_security_group_ids = []
      destination_port_range                     = "22"
      destination_port_ranges                    = []
      direction                                  = "Inbound"
      name                                       = "AllowAnySSHInbound"
      priority                                   = 101
      protocol                                   = "Tcp"
      source_address_prefix                      = "*"
      source_address_prefixes                    = []
      source_application_security_group_ids      = []
      source_port_range                          = "*"
      source_port_ranges                         = []
    }
  ]
}

