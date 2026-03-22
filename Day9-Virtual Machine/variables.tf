variable "environment" {
  type        = string
  description = "Environment Name"

}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"

}

variable "location" {
  type        = string
  description = "Azure region"

}

variable "virtual_network_name" {
  type        = string
  description = "Virtual Network Name"

}

variable "storage_account_name" {
  type        = string
  description = "Storage Account Name"
}

variable "storage_container_name" {
  type        = string
  description = "Storage Container Name"
}

variable "network_interface" {
  type        = string
  description = "Attach the nic to the vm"

}
variable "ip_config" {
  type        = string
  description = "Attach ip to the nic"
}
variable "virtual_machine_name" {
  type        = string
  description = "Virtual Machine Name"

}
variable "disk_size_gb" {
  type        = number
  description = "Size of the OS Disk"
}
variable "is_os_disk_delete" {
  type        = bool
  description = "Delete the OS disk upon virtual machine termination"

}