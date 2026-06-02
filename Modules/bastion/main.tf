resource "azurerm_public_ip" "pip" {
  for_each = var.bastion_map

  name                = "${each.key}-pip"
  location            = var.location          
  resource_group_name = var.rg_name          
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion" {
  for_each = var.bastion_map

  name                = each.key
  location            = var.location          
  resource_group_name = var.rg_name           

  ip_configuration {
    name                 = "config"
    subnet_id            = each.value.subnet_id
    public_ip_address_id = azurerm_public_ip.pip[each.key].id
  }
}