# variable "logic_app_config" {
#     type = map(object({
#         name = string
#         FUNCTIONS_WORKER_RUNTIME = any
#         WEBSITE_NODE_DEFAULT_VERSION = any
#         # public_network_access_enabled = bool
#     }))
# }

variable "product" {
  type = any
  default = ""
}

# variable "eventHub_connectionString" {
#   type = string
#   default = ""
# }
variable "logic_app_config" {
    type = map(object({
        FUNCTIONS_WORKER_RUNTIME = optional(string,"node")
        WEBSITE_NODE_DEFAULT_VERSION = optional(string,"~18")
        # # FUNCTIONS_EXTENSION_VERSION = optional(string,"")
        # Smtp_enableSSL = bool
        # Smtp_password = optional(string,null)
        # Smtp_port = optional(string,null)
        # Smtp_serverAddress = optional(string,null)
        # Smtp_username = optional(string,null)
        public_network_access_enabled = optional(bool,false)
        
        # ip_address = optional(list(string), ["0.0.0.0/0"])
    }))
}


variable "location" {
    type =any
    default = ""
}

# variable "product" {
#     type = any
# }

variable "resource_group_name" {
  type = any
  default = ""
}

variable "lg_app_service_id" {
    type = any
    default = ""
}

variable "lg_storage_account_name" {
    type = any
    default = ""
}

variable "lg_primary_access_key" {
    type = any
    default = ""
}


variable "eventHub_connectionString" {
  type = any
  default = ""
}

variable "connection_string" {
    type = any
    default = ""
}