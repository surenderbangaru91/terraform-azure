variable "environment" {
  description = "Environment (dev/prod)"
  type        = string
}

variable "region" {
  type        = string
  description = "Azure region"

  validation {
    condition     = var.region == "West Europe"
    error_message = "Only West Europe region is allowed."
  }
}

variable "prefix" {
  type        = string
  description = "Resource name prefix"
}

variable "instance_count" {
  type = number
}

variable "address_space" {
  type = list(string)
}

variable "app_subnet" {
  type = list(string)
}

variable "mgmt_subnet" {
  type = list(string)
}

/*
variable "pub_key" {
  type        = string
  description = "vm public key"

}*/

variable "admin_passwd" {
  type      = string
  sensitive = true
}