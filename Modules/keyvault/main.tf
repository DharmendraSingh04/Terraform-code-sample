resource "azurerm_key_vault" "kv" {
  for_each = var.kv_map

  name                = each.value.name
  location            = var.location
  resource_group_name = var.rg_name
  tenant_id           = var.tenant_id
  sku_name            = "standard"
}