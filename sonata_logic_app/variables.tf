#The location and product
variable "location" {
  type = string
  default = ""
}

# variable "resource_group_name" {
#   type = string
#   default = ""
# }

variable "product" {
  type = any
  default = ""
}

#Application Insights Configuration along with the workspace id of the loganalytics workspace
variable "appinsights_config" {
  type = object({
    # appname = string
    apptype = string
  })
}

variable "workspace_id" {
  type = any
  default = ""
}

variable "instrumentation_key" {
    type = any
    default = ""
}

variable "connection_string" {
    type = any
    default = ""
}


#App Service Plan Configuration
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

variable "app_service_id" {
    type = any
    default = ""
}


#Storage Account Configuration
variable "storage_acc_config" {
    description = "configration of the storage account"
    type = map(object({
    # storage_acc_name = string,
    account_tier = optional(string,"Standard"),
    account_replication_type = optional(string, "LRS"),
    public_network_access_enabled = optional(bool, true)
    allow_blob_public_access = optional(bool,false)
    versioning_enabled = optional(bool,false)
    networkrules_defaultaction = optional(string,"Deny")
    ip_rules = optional(list(string), ["0.0.0.0/0"])
  }))
}
 

variable "storage_account_name" {
    type = any
    default = ""
}

variable "primary_access_key" {
    type = any
    default = ""
}


variable "logic_app_config" {
    type = map(object({
        # FUNCTIONS_WORKER_RUNTIME = optional(string,"node")
        # WEBSITE_NODE_DEFAULT_VERSION = optional(string,"~18")
        # # FUNCTIONS_EXTENSION_VERSION = optional(string,"")
        # Smtp_enableSSL = optional(bool,false)
        # Smtp_password = optional(string,null)
        # Smtp_port = optional(string,null)
        # Smtp_serverAddress = optional(string,null)
        # Smtp_username = optional(string,null)
        public_network_access_enabled = optional(bool,false)
    }))
}


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


#DNS Configuration
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

variable "service" {
  type = any
  default = ""
}

# Loganalytics
variable "log_name" {
  type = string
  default = ""
}

variable "sku" {
  type = any
  default = ""
}

variable "retention" {
  type = any
  default = ""
}

variable "resource_group_name" {
  type = any
  default = ""
}

variable "outbound_subnet" {
  type = any
  default = ""
}

variable "resource_principal_id" {
  type = any
  default = ""
}
 
variable "scope" {
  type = string
  default = ""
}
 
variable "role_definition_name" {
  type = string
  default = ""
}

# variable "eventHub_connectionString" {
#   type = any
#   default = ""
# }


# variable "link_name" {
#   type = string
#   default = ""
# }

# variable "private_dns_zone" {
#   type = any
#   default = ""
# }


# variable "registration_enabled" {
#     type = bool
#     default = false
  
# }
# variable "vnet_id" {
#   type = any
#   default = ""
# }


variable "registration_enabled" {
    type = bool
    default = false
  
}
variable "vnet_id" {
  type = any
  default = ""
}


variable "link_name" {
  type = any
  default = ""
  
}

variable "private_dns_zone_storage_file" {
  type = any
  default = ""
}

variable "private_dns_zone" {
  type = any
  default = ""
}

variable "private_dns_zone_storage" {
  type = any
  default = ""
}

variable "private_dns_zone_storage_queue" {
  type = any
  default = ""
}

variable "private_dns_zone_storage_table" {
  type = any
  default = ""
}

variable "name" {
  type = string
  default = ""
}

variable "storage_name" {
  type = string
  default = ""
}

variable "quota" {
  type = any
  default = ""
}