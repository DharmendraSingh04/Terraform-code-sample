variable "location" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "vm_size" {
  type    = string
  default = "Standard_D2s_v3"
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type = string
}

variable "os_disk_type" {
  type    = string
  default = "Standard_LRS"
}

variable "subnet_ids" {
  type = map(string)
}

variable "vmss_map" {
  type = map(object({
    subnet    = string
    instances = number
  }))
}

variable "image" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })

  default = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

variable "tags" {
  type    = map(string)
  default = {}
}