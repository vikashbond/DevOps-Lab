variable "resource_group_name" {
   description = "This is resource group name"
   type = string
}

variable "location" {
  description = "Azure Region"
  type = string
}

variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
}

variable "vnet_address_space" {
  description = "VNet Address Space"
  type        = list(string)
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
}

variable "subnet_prefix" {
  description = "Subnet Address Prefix"
  type        = list(string)
}

variable "nsg_name" {
  description = "Network Security Group Name"
  type        = string
}

variable "public_ip_name" {
  type        = string
}

variable "nic_name" {
  type        = string
}

variable "vm_name" {  
  type       = string
}

variable "admin_username" {
type         = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "vm_size" {
  type      = string
}


variable "vm_count" {
  type     = number
}
