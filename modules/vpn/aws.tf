


resource "aws_vpn_gateway" "main" {
    availability_zone = "us-east-1a"
  tags = {
    Name = var.vpn_name
  }
}

resource "aws_vpn_gateway_attachment" "vpn_attachment" {
  vpc_id         = var.vpc_id
  vpn_gateway_id = aws_vpn_gateway.main.id
}

#### Create these resources after the inital apply to get the public IP address and to avoid crazy errors

resource "aws_customer_gateway" "customer_gateway" {
  bgp_asn    = 65000
  ip_address = azurerm_public_ip.vpn_public_ip.ip_address ## public IP address of the azure vpn gateway.. get after it is built
  type       = "ipsec.1"

  tags = {
    Name = var.customer_gateway
  }
  
  depends_on = [ azurerm_virtual_network_gateway.azure_vpn_gateway ]
}


resource "aws_vpn_connection" "main" {
  vpn_gateway_id      = aws_vpn_gateway.main.id
  customer_gateway_id = aws_customer_gateway.customer_gateway.id
  type                = "ipsec.1"
  static_routes_only  = true
  tunnel_inside_ip_version = "ipv4"
  tunnel1_preshared_key = var.preshared_key1
  tunnel2_preshared_key = var.preshared_key2

  tags = {
    Name = var.vpn_connection
  }
}

## So far this resource was the main I was missing in there other instances of this project
## I didn't have the vpn_connection_id option

resource "aws_vpn_connection_route" "azure" {
  destination_cidr_block = element(var.az_vnet_cidr, 0) ## azure vnet cidr. use the element arg with the var, 0 to indicate only one to be specified
  
  vpn_connection_id      = aws_vpn_connection.main.id 
}

resource "aws_vpn_gateway_route_propagation" "route_propagation" {
  vpn_gateway_id = aws_vpn_gateway.main.id
  route_table_id = var.aws_route_table_id
}