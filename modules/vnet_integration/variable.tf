variable "outbound_subnet" {
  type = string
  default = ""
}

variable "vnet_integeration_config" {
  type = map(any)
  default = {}
}