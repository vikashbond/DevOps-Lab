resource "azurerm_resource_group" "dev" {

    name       = var.resource_group_name
    location   = var.location
}

resource "azurerm_virtual_network" "vnet" {
    
    name                = var.vnet_name
    location            = var.location
    resource_group_name = azurerm_resource_group.dev.name
    address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "subnet" {
    
   name                 = var.subnet_name
   resource_group_name  = azurerm_resource_group.dev.name
   virtual_network_name = azurerm_virtual_network.vnet.name
   address_prefixes     = var.subnet_prefix
}

resource "azurerm_network_security_group" "nsg" {
   
   name                 = var.nsg_name
   location             = var.location
   resource_group_name  = azurerm_resource_group.dev.name

   security_rule {

    name                	= "Allow-SSh"
    priority            	= 100
    direction           	= "Inbound"
    access              	= "Allow"
    protocol			= "Tcp"
    source_port_range		= "*"
    destination_port_range	= "22"
    source_address_prefix	= "*"
    destination_address_prefix	= "*"
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
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}    


resource "azurerm_public_ip" "pip" {

count			      = var.vm_count
name		              = "${var.public_ip_name}-${count.index}"
location                      = var.location
resource_group_name           = azurerm_resource_group.dev.name

allocation_method             = "Static"
sku			      = "Standard"
}

resource "azurerm_network_interface" "nic" {

   count                        = var.vm_count
   name				= "${var.nic_name}-${count.index}"
   location		        = var.location
   resource_group_name		= azurerm_resource_group.dev.name

   ip_configuration {

     name				= "internal"
     subnet_id				= azurerm_subnet.subnet.id
     private_ip_address_allocation	= "Dynamic"
     public_ip_address_id		= azurerm_public_ip.pip[count.index].id
}
}

	      
resource "azurerm_linux_virtual_machine" "vm" {
  
  count               = var.vm_count
  name                = "${var.vm_name}-${count.index}"
  resource_group_name = azurerm_resource_group.dev.name
  location            = var.location
  size                = var.vm_size

  admin_username = var.admin_username
  admin_password = var.admin_password

  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic[count.index].id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

resource "null_resource" "update_inventory" {

  triggers = {
    vm_ips = join(",", azurerm_public_ip.pip[*].ip_address)
  }

  provisioner "local-exec" {

    command = <<EOT

sed -i '/\\[webservers\\]/,$d' /home/devOpsUser/DevOps-Lab/ansible/inventory.ini

echo "[webservers]" >> /home/devOpsUser/DevOps-Lab/ansible/inventory.ini

%{ for ip in azurerm_public_ip.pip[*].ip_address ~}
echo "${ip}" >> /home/devOpsUser/DevOps-Lab/ansible/inventory.ini
%{ endfor ~}

EOT

  }

  depends_on = [
    azurerm_linux_virtual_machine.vm
  ]
}
