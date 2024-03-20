variable "link_name" {
  type = string
  default = ""
}

variable "private_dns_rg" {
  type = any
  default = ""
}

variable "private_dns_zone" {
  type = any
  default = ""
}


variable "registration_enabled" {
    type = bool
    default = false
  
}
variable "vnet_id" {
  type = any
  default = ""
}