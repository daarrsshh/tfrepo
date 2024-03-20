variable "eventhub_namespace_config" {
    type = object({
      # namespace_name = string
      sku = string
      capacity =string
      # public_network_access_enabled = optional(bool,false)
    })
  
}

variable "eventhub_ns_public_network_access_enabled" {
  type = bool
  default = false
  
}

variable "eventhub_config" {
    type = object({
      # eventhub_name = string
      partition_count = number
      message_retention = number 
    })
  
}

variable "eventhub-authorize" {
  type = map(object({
    # policy_name = string
    send = optional(bool,false)
    manage = optional(bool,false)
    listen = optional(bool,false)
  }))
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "role" {
  type = string
  description = "the role access for the eventhub namespace"
}


variable "product" {
  type = string
  default = ""
}

variable "pid" {
  type = string 
  default = ""
  description = "the principal id for which the role should be assigned"
}

