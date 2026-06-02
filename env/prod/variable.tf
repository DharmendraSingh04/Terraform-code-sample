variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "storage_map" {
  type = map(object({
    name = string
  }))
}

variable "tags" {
  type = map(string)
}

variable "vnet_name" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "subnets" {
  type = map(string)
}

# variable "tags" {
#   type = map(string)
# }

variable "sql_map" {
  type = map(object({
    name     = string
    admin    = string
    password = string
    db_name  = string
  }))
}

variable "tenant_id" {
  type = string
}

variable "kv_map" {
  type = map(object({
    name = string
  }))
}

# variable "bastion_map" {
#   type = map(object({
#     subnet_id = string
#   }))
# }

# variable "lb_map" {
#   type = map(object({
#     subnet_id = string
#   }))
# }

# variable "appgw_map" {
#   type = map(object({
#     subnet_id = optional(string)
#   }))
# }

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type = string
}

# variable "tags" {
#   type = map(string)
# }

variable "vmss_map" {
  type = map(object({
    subnet    = string
    instances = number
  }))
}