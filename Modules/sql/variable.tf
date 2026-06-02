variable "location" {}
variable "rg_name" {}

variable "sql_map" {
  type = map(object({
    name     = string
    admin    = string
    password = string
    db_name  = string
  }))
}