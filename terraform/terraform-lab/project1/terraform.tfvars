resource_group_name = "rg-terraform-lab"
location            = "East US"

vnet_name           = "vnet-terraform-lab"
vnet_address_space  = ["10.0.0.0/16"]

subnet_name         = "subnet-frontend"
subnet_prefix       = ["10.0.1.0/24"]

nsg_name            = "nsg-terraform-lab"

public_ip_name 	    = "vm-public-ip"
nic_name            = "vm-nic"
vm_name             = "vm-terraform"

admin_username      = "devOpsUser"
admin_password      = "Nathcorp!1234"    

vm_size             = "Standard_B1s"

vm_count            = 3
