
resource "azurerm_subnet" "gateway_subnet" {
  name                 = var.gateway_subent
  virtual_network_name = var.az_vnet_name
  resource_group_name  = var.az_rg_name
  address_prefixes     = var.gateway_sub_cidr

}

#Create Public IP for the gateway

resource "azurerm_public_ip" "vpn_public_ip" {
  name                = var.vpn_ip
  location            = var.az_location
  resource_group_name = var.az_rg_name
  allocation_method   = "Static"
  sku                 = "Standard"

}

# Create vnet gateway and attach the public IP address

resource "azurerm_virtual_network_gateway" "azure_vpn_gateway" {
  name                = var.az_vpn_name
  location            = var.az_location
  resource_group_name = var.az_rg_name
  type     = "Vpn"
  vpn_type = "RouteBased"

  active_active = false
  enable_bgp    = false
  sku           = "VpnGw1"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = azurerm_public_ip.vpn_public_ip.id
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.gateway_subnet.id
  }
  depends_on = [ var.gateway_subent ]
}



#Create local network gateway, reps the sit or the on-prem network in this case AWS VPC
#### Create these resources after the inital apply to get the public IP address of the tunnels and to avoid crazy errors

resource "azurerm_local_network_gateway" "tunnel1" {
  name                = var.local_ng_name
  resource_group_name = var.az_rg_name
  location            = var.az_location
  gateway_address     = aws_vpn_connection.main.tunnel1_address ## Get this address from the first aws tunnel when created
  address_space       = [var.vpc_cidr_block] ## cidr of the aws vpc
}


resource "azurerm_virtual_network_gateway_connection" "onpremise" {
  name                = var.vnet_gateway_con_name
  location            = var.az_location
  resource_group_name = var.az_rg_name
  type                       = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.azure_vpn_gateway.id
  local_network_gateway_id   = azurerm_local_network_gateway.tunnel1.id
  shared_key = var.preshared_key1  ## first pre shared key(where do I find these)
}




resource "azurerm_local_network_gateway" "tunnel2" {
  name                = var.local_ng_name2
  resource_group_name = var.az_rg_name
  location            = var.az_location
  gateway_address     = aws_vpn_connection.main.tunnel2_address ## Get this address from the second aws tunnel when created
  address_space       = [var.vpc_cidr_block] ## cidr of the aws vpc
}


resource "azurerm_virtual_network_gateway_connection" "onpremise2" {
  name                = var.vnet_gateway_con_name2
  location            = var.az_location
  resource_group_name = var.az_rg_name
  type                       = "IPsec"
  virtual_network_gateway_id = azurerm_virtual_network_gateway.azure_vpn_gateway.id
  local_network_gateway_id   = azurerm_local_network_gateway.tunnel2.id
  shared_key = var.preshared_key2   ## second pre shared key(where do I find these)
}

