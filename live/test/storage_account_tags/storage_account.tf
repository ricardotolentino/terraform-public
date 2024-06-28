resource "random_integer" "random_storage_account_int" {
  count = local.storage_account_count

  keepers = {
    storage_account_name_prefix = "${local.storage_account_name_prefix}-${count.index}"
  }
  min = 0
  max = 9999
}

resource "azurerm_storage_account" "sa" {
  count = local.storage_account_count

  #name                = "${var.storage_account_prefix}${format("%04d", random_integer.random_storage_account_int.id)}"
  name                            = "${local.storage_account_name_prefix}${format("%04d", random_integer.random_storage_account_int[count.index].id)}"
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  allow_nested_items_to_be_public = true
}
