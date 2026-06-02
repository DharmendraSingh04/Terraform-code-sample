variable "location" {}
variable "rg_name" {}

variable "storage_map" {
  type = map(object({
    name = string
  }))
}

variable "tags" {
  type = map(string)
}