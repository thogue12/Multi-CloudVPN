
# #Create Public IP for the gateway

# resource "azurerm_public_ip" "vpn_public_ip" {
#   name                = var.vpn_ip
#   location            = var.location
#   resource_group_name = var.rg_name
#   allocation_method   = "Static"
#   sku                 = "Standard"

# }

# # Create vnet gateway and attach the public IP address

# resource "azurerm_virtual_network_gateway" "azure_vpn_gateway" {
#   name                = var.az_vpn_name
#   location            = var.location
#   resource_group_name = var.rg_name
#   type     = "Vpn"
#   vpn_type = "RouteBased"

#   active_active = false
#   enable_bgp    = false
#   sku           = "VpnGw1"

#   ip_configuration {
#     name                          = "vnetGatewayConfig"
#     public_ip_address_id          = azurerm_public_ip.vpn_public_ip.id
#     private_ip_address_allocation = "Dynamic"
#     subnet_id                     = azurerm_subnet.gateway_subnet.id
#   }
# }

# #Create a route table

# resource "azurerm_route_table" "example_az_rt" {
#   name                = "vpn-route-table"
#   resource_group_name = var.rg_name
#   location            = var.location

#   route {
#     name                   = "ToAWS"
#     address_prefix         = "172.0.0.0/16"  # CIDR block of the AWS network
#     next_hop_type          = "VirtualAppliance"  # This is for VPN gateway
#     next_hop_in_ip_address = "10.0.4.30"  # Private IP address of the VPN gateway
#   }

#   tags = {
#     environment = "production"
#   }
  
# }

# #Create local network gateway, reps the sit or the on-prem network in this case AWS VPC
# #### Create these resources after the inital apply to get the public IP address of the tunnels and to avoid crazy errors

# resource "azurerm_local_network_gateway" "tunnel1" {
#   name                = var.local_ng_name
#   resource_group_name = var.rg_name
#   location            = var.location
#   gateway_address     = "34.228.154.163" ## Get this address from the first aws tunnel when created
#   address_space       = ["172.0.0.0/16"] ## cidr of the aws vpc
# }


# resource "azurerm_local_network_gateway" "tunnel2" {
#   name                = var.local_ng_name2
#   resource_group_name = var.rg_name
#   location            = var.location
#   gateway_address     = "35.174.152.37" ## Get this address from the second aws tunnel when created
#   address_space       = ["172.0.0.0/16"] ## cidr of the aws vpc
# }

# resource "azurerm_virtual_network_gateway_connection" "onpremise" {
#   name                = var.vnet_gateway_con_name
#   location            = var.location
#   resource_group_name = var.rg_name
#   type                       = "IPsec"
#   virtual_network_gateway_id = azurerm_virtual_network_gateway.azure_vpn_gateway.id
#   local_network_gateway_id   = azurerm_local_network_gateway.tunnel1.id
#   shared_key = "abc123dsfjkl34"  ## first pre shared key(where do I find these)
# }

# resource "azurerm_virtual_network_gateway_connection" "onpremise2" {
#   name                = var.vnet_gateway_con_name2
#   location            = var.location
#   resource_group_name = var.rg_name
#   type                       = "IPsec"
#   virtual_network_gateway_id = azurerm_virtual_network_gateway.azure_vpn_gateway.id
#   local_network_gateway_id   = azurerm_local_network_gateway.tunnel2.id
#   shared_key = "abc1234ioeuiore"   ## second pre shared key(where do I find these)
# }

