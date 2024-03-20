variable "appinsights_config" {
  type = object({
    # appname = string
    apptype = string
  })
}

variable "service" {
  type = any
  default = ""
}
variable "location" {
  type = string
  default = ""
}

variable "product" {
  type = string
  default = ""
}

variable "resource_group_name" {
  type = string
  default = "" 
}

variable "workspace_id" {
  type = string
  default = ""
}