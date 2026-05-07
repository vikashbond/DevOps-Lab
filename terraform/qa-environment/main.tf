terraform {
  required_providers {
    azurerm = {
      source  = "azurerm"
      version = "4.66.0"
    }
  }
}
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "res-0" {
  location   = var.location
  name       = "rg-${var.environment}-terraform-lab"
  tags       = {}
}
resource "azurerm_linux_virtual_machine" "res-1" {
  admin_username                                         = "devOpsUser"
  admin_password                                         = var.admin_password
  allow_extension_operations                             = true
  bypass_platform_safety_checks_on_user_schedule_enabled = false
  computer_name                                          = "vm-${var.environment}-terraform-0"
  disable_password_authentication                        = false
  encryption_at_host_enabled                             = false
  extensions_time_budget                                 = "PT1H30M"
  location                                               = var.location
  max_bid_price                                          = -1
  name                                                   = "vm-${var.environment}-terraform-0"
  network_interface_ids                                  = [azurerm_network_interface.res-4.id]
  patch_assessment_mode                                  = "ImageDefault"
  patch_mode                                             = "ImageDefault"

  priority                                               = "Regular"
  provision_vm_agent                                     = true
  resource_group_name                                    = azurerm_resource_group.res-0.name
  secure_boot_enabled                                    = false
  size                                                   = "Standard_B1s"
  tags                                                   = {}
  
  vtpm_enabled                                           = false
  os_disk {
    caching                          = "ReadWrite"
    disk_size_gb                     = 30
    name                             = "vm-terraform-0_OsDisk_1_${var.environment}"
    storage_account_type             = "Standard_LRS"
    write_accelerator_enabled        = false
  }
  source_image_reference {
    offer     = "0001-com-ubuntu-server-jammy"
    publisher = "Canonical"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
resource "azurerm_linux_virtual_machine" "res-2" {
  admin_username                                         = "devOpsUser"
  admin_password                                         = var.admin_password
  allow_extension_operations                             = true
  bypass_platform_safety_checks_on_user_schedule_enabled = false
  computer_name                                          = "vm-${var.environment}-terraform-1"
  disable_password_authentication                        = false
  encryption_at_host_enabled                             = false
  extensions_time_budget                                 = "PT1H30M"
  location                                               = var.location
  max_bid_price                                          = -1
  name                                                   = "vm-${var.environment}-terraform-1"
  network_interface_ids                                  = [azurerm_network_interface.res-5.id]
  patch_assessment_mode                                  = "ImageDefault"
  patch_mode                                             = "ImageDefault"
  
  priority                                               = "Regular"
  provision_vm_agent                                     = true
  resource_group_name                                    = azurerm_resource_group.res-0.name
  secure_boot_enabled                                    = false
  size                                                   = "Standard_B1s"
  tags                                                   = {}
  
  vtpm_enabled                                           = false
  os_disk {
    caching                          = "ReadWrite"
    disk_size_gb                     = 30
    name                             = "vm-terraform-1_disk1_${var.environment}"
    storage_account_type             = "Standard_LRS"
    write_accelerator_enabled        = false
  }
  source_image_reference {
    offer     = "0001-com-ubuntu-server-jammy"
    publisher = "Canonical"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
resource "azurerm_linux_virtual_machine" "res-3" {
  admin_username                                         = "devOpsUser"
  admin_password                                         = var.admin_password
  allow_extension_operations                             = true
  bypass_platform_safety_checks_on_user_schedule_enabled = false
  computer_name                                          = "vm-${var.environment}-terraform-2"
  disable_password_authentication                        = false
  encryption_at_host_enabled                             = false
  extensions_time_budget                                 = "PT1H30M"
  location                                               = var.location
  max_bid_price                                          = -1
  name                                                   = "vm-${var.environment}-terraform-2"
  network_interface_ids                                  = [azurerm_network_interface.res-6.id]
  patch_assessment_mode                                  = "ImageDefault"
  patch_mode                                             = "ImageDefault"
  
  priority                                               = "Regular"
  provision_vm_agent                                     = true
  resource_group_name                                    = azurerm_resource_group.res-0.name
  secure_boot_enabled                                    = false
  size                                                   = "Standard_B1s"
  tags                                                   = {}
  
  vtpm_enabled                                           = false
  os_disk {
    caching                          = "ReadWrite"
    disk_size_gb                     = 30
    name                             = "vm-terraform-2_OsDisk_1_${var.environment}"
    storage_account_type             = "Standard_LRS"
    write_accelerator_enabled        = false
  }
  source_image_reference {
    offer     = "0001-com-ubuntu-server-jammy"
    publisher = "Canonical"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
resource "azurerm_network_interface" "res-4" {
  accelerated_networking_enabled = false
  ip_forwarding_enabled          = false
  location                       = var.location
  name                           = "vm-${var.environment}-nic-0"
  resource_group_name            = azurerm_resource_group.res-0.name
  tags                           = {}
  ip_configuration {
    name                                               = "internal"
    primary                                            = true
    private_ip_address_allocation                      = "Dynamic"
    private_ip_address_version                         = "IPv4"
    public_ip_address_id                               = azurerm_public_ip.res-11.id
    subnet_id                                          = azurerm_subnet.res-15.id
  }
  
}
resource "azurerm_network_interface" "res-5" {
  accelerated_networking_enabled = false
  ip_forwarding_enabled          = false
  location                       = var.location
  name                           = "vm-${var.environment}-nic-1"
  resource_group_name            = azurerm_resource_group.res-0.name
  tags                           = {}
  ip_configuration {
    name                                               = "internal"
    primary                                            = true
    private_ip_address_allocation                      = "Dynamic"
    private_ip_address_version                         = "IPv4"
    public_ip_address_id                               = azurerm_public_ip.res-12.id
    subnet_id                                          = azurerm_subnet.res-15.id
 }
}
resource "azurerm_network_interface" "res-6" {
  accelerated_networking_enabled = false
  ip_forwarding_enabled          = false
  location                       = var.location
  name                           = "vm-${var.environment}-nic-2"
  resource_group_name            = azurerm_resource_group.res-0.name
  tags                           = {}
  ip_configuration {
    name                                               = "internal"
    primary                                            = true
    private_ip_address_allocation                      = "Dynamic"
    private_ip_address_version                         = "IPv4"
    public_ip_address_id                               = azurerm_public_ip.res-13.id
    subnet_id                                          = azurerm_subnet.res-15.id
  }
  
}
resource "azurerm_network_security_group" "res-7" {
  location            = var.location
  name                = "nsg-${var.environment}-terraform-lab"
  resource_group_name = azurerm_resource_group.res-0.name
   security_rule {
    name                       = "Allow-SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-HTTP"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-8080"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
} 

resource "azurerm_public_ip" "res-11" {
  allocation_method       = "Static"
  ddos_protection_mode    = "VirtualNetworkInherited"
  idle_timeout_in_minutes = 4
  ip_tags                 = {}
  ip_version              = "IPv4"
  location                = var.location
  name                    = "vm-${var.environment}-public-ip-0"
  resource_group_name     = azurerm_resource_group.res-0.name
  sku                     = "Standard"
  sku_tier                = "Regional"
  tags                    = {}
}
resource "azurerm_public_ip" "res-12" {
  allocation_method       = "Static"
  ddos_protection_mode    = "VirtualNetworkInherited"
  idle_timeout_in_minutes = 4
  ip_tags                 = {}
  ip_version              = "IPv4"
  location                = var.location
  name                    = "vm-${var.environment}-public-ip-1"
  resource_group_name     = azurerm_resource_group.res-0.name
  sku                     = "Standard"
  sku_tier                = "Regional"
  tags                    = {}
}
resource "azurerm_public_ip" "res-13" {
  allocation_method       = "Static"
  ddos_protection_mode    = "VirtualNetworkInherited"
  idle_timeout_in_minutes = 4
  ip_tags                 = {}
  ip_version              = "IPv4"
  location                = var.location
  name                    = "vm-${var.environment}-public-ip-2"
  resource_group_name     = azurerm_resource_group.res-0.name
  sku                     = "Standard"
  sku_tier                = "Regional"
  tags                    = {}
}
resource "azurerm_virtual_network" "res-14" {
  address_space                  = ["10.0.0.0/16"]

  location                       = var.location
  name                           = "vnet-${var.environment}-terraform-lab"
  private_endpoint_vnet_policies = "Disabled"
  resource_group_name            = azurerm_resource_group.res-0.name
  
  tags = {}
}
resource "azurerm_subnet" "res-15" {
  address_prefixes                              = ["10.0.1.0/24"]
  default_outbound_access_enabled               = true
  name                                          = "subnet-frontend"
  private_endpoint_network_policies             = "Enabled"
  private_link_service_network_policies_enabled = true
  resource_group_name                           = azurerm_resource_group.res-0.name
  virtual_network_name                          = azurerm_virtual_network.res-14.name
  
}
resource "azurerm_subnet_network_security_group_association" "res-16" {
  network_security_group_id = azurerm_network_security_group.res-7.id
  subnet_id                 = azurerm_subnet.res-15.id
}
