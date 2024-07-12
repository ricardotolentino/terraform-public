module "rg" {
  source = "../../../../modules/rg"
  providers = {
    azurerm.mod_sub = azurerm.dev
  }

  location = "eastus2"
  suffix   = "public-test-dev-eastus2"
  tags = {
    env = "dev"
  }
}
