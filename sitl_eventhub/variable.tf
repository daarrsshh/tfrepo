#eventhub namespace
variable "eventhub_namespace_config" {
    type = object({
      # namespace_name = string
      sku = string
      capacity = string
      # public_network_access_enabled =bool
    })
  
}

variable "eventhub_ns_public_network_access_enabled" {
  type = bool
  default = false
  
}

#eventhub
variable "eventhub_config" {
    type = object({
      # eventhub_name = string
      partition_count = number
      message_retention = number 
    })
  
}

#policy on eventhub
variable "eventhub-authorize" {
  type = map(object({
    # policy_name = string
    send = optional(bool, false)
    manage = optional(bool, false)
    listen = optional(bool, false)
  }))
}

#the role assignment
variable "role" {
  type = string
  description = "the role access for the eventhub namespace"
}

variable "pid" {
  type = string 
  default = ""
  description = "the principal id for which the role should be assigned"
}

#The resource group where the eventhub and its dependencies should fall into
variable "resource_group_name" {
  type = string
  default = ""
}

#the location
variable "location" {
  type = string
  default = ""
}

#private endpoint
variable "private_endpoint_config" {
    description = "configration of the storage account"
    type = any
    default = [ "" ]
}

variable "resource_key" {
  type = map(any)
  default = {
    
  }
}

variable "is_manual_connection" {
  type = bool
  default = false
}

#the subnet under which the private endpoint should be
variable "subnet_id" {
  type = any
  default = ""
}
#DNS A Record
variable "dns_a_record_config" {
  type = any
  default = ""
}

variable "ttl" {
  type = number
  default = 300
}

variable "private_dns_rg" {
  type = any
  default = ""
}

#product
variable "product" {
  type = any
  default = ""
}

# variable "resource_group_name" {
#   type = any
#   default = ""

# }

variable "link_name" {
  type = string
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

variable "enable_namespace_pep" {
  type = bool
  default = false
}
