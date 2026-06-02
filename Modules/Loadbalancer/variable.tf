variable "location" {}
variable "rg_name" {}

variable "lb_map" {
  type = map(object({
    subnet_id = string
  }))
}
