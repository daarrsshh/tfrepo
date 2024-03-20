variable "location" {
  type = string
  default = ""
}

variable "resource_group_name" {
  type = string
  default = ""
}

variable "sku" {
  type = string
  default = ""
}

variable "product" {
  type = string
  default = ""
}

variable "trusted_services_allowed" {
  type = bool
  default = true
}

variable "role" {
  type = string
  default = ""
}

variable "pid" {
  type = any
  default = ""
}

variable "servicebus_public_network_access_enabled" {
  type = any
  default = false
}