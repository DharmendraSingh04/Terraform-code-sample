variable "location" {}
variable "rg_name" {}
variable "tenant_id" {}

variable "kv_map" {
  type = map(object({
    name = string
  }))
}