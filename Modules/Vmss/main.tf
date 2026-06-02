resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  for_each = var.vmss_map

  name                = "${each.key}-vmss"
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.vm_size
  instances           = each.value.instances
  zones = ["1"]
  admin_username = var.admin_username

  # 🔐 Password OR SSH (choose one)
  admin_password = var.admin_password

  disable_password_authentication = false

  source_image_reference {
    publisher = var.image.publisher
    offer     = var.image.offer
    sku       = var.image.sku
    version   = var.image.version
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.os_disk_type
  }

  network_interface {
    name    = "${each.key}-nic"
    primary = true

    ip_configuration {
      name      = "internal"
      subnet_id = var.subnet_ids[each.value.subnet]
      primary   = true
    }
  }

  upgrade_mode = "Manual"

  tags = var.tags
}