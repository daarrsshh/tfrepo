variable "appservice_config" {
    type = object({
        # app_service_name = string
        os_type = string
        sku_name = any
        zone_enable = bool
        worker_count = any
        max_worker = any
    })
}

variable "service" {
  type = any
  default = ""
}

variable "product" {
  type = any
  default = ""
}
variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
  default = ""
}