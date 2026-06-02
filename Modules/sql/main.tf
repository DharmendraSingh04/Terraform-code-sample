resource "azurerm_mssql_server" "sql" {
  for_each = var.sql_map

  name                         = each.value.name
  resource_group_name          = var.rg_name
  location                     = var.location
  version                      = "12.0"

  administrator_login          = each.value.admin
  administrator_login_password = each.value.password
}

resource "azurerm_mssql_database" "db" {
  for_each = var.sql_map

  name      = each.value.db_name
  server_id = azurerm_mssql_server.sql[each.key].id
  sku_name  = "Basic"
}