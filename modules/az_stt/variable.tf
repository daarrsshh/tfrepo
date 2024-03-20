variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  type        = string
}

# variable "custom_name" {
#   description = "The custom sub domain name of the cognitive services account"
#   type        = string
# }

variable "throttle_enable" {
  type = bool
  default = true
}

variable "access" {
  type = bool
  default = false
}

variable "sku_name" {
    default = ""
    type = any
}

variable "kind" {
    default = ""
    type = string
}

variable "role" {
  default = ""
  type = string
}

variable "pid" {
  default = ""
  type = any
}

variable "product" {
  default = ""
  type = string
}
