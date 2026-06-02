variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "bastion_map" {
  type = map(object({
    subnet_id = string
  }))
}