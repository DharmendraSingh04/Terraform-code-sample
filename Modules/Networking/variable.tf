variable "vnet_name" {}
variable "location" {}
variable "rg_name" {}
variable "address_space" {
  type = list(string)
}
variable "subnets" {
  type = map(string)
}
variable "tags" {
  type = map(string)
}