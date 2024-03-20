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

variable "location" {
    description = "location of the storage account"
    type = string
  
}

variable "resource_group_name" {
    description = "product it is deployed for"
    type = string 
}

variable "subnet_id" {
  type = any
  default = ""
}
