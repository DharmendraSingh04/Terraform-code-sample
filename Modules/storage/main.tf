resource "azurerm_storage_account" "sa" {
  for_each = var.storage_map

  name                     = each.value.name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}
