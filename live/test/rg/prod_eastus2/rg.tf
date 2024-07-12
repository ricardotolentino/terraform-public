module "rg" {
  source = "../../../../modules/rg"
  providers = {
    azurerm.mod_sub = azurerm.prod
  }

  location = "eastus2"
  suffix   = "public-test-prod-eastus2"
  tags = {
    evn = "prod"
  }
}
