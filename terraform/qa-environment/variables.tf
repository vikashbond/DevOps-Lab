variable "environment" {
  description = "Environment name"
  default     = "qa"
}

variable "location" {
  default = "eastus"
}

variable "admin_password" {
  description = "Admin password for VM"
  type        = string
  sensitive   = true
}
