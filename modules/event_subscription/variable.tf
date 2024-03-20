variable "event_topic" {
  type = string
  default = ""
}

variable "resource_group_name" {
  type = any
  default = ""
}


variable "location" {
    type =any
    default = ""
}

variable "source_id" {
    type =any
    default = ""
}

variable "scope_id" {
    type =any
    default = ""
}

variable "event_subs" {
    type = string
    default = ""
}

variable "event_schema" {
  type = string
  default = ""
}

variable "event_types" {
    type = string
    default = ""
}

variable "webhook_url" { 
    type = any
    default = ""
}

variable "topic_type" {
  type = any
  default = ""
}