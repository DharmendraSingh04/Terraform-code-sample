variable "appgw_map" {
  type = map(object({
    subnet_id = optional(string)
  }))
}
variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}
