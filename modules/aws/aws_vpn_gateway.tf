

# resource "aws_vpn_gateway" "my_vpn" {
#     availability_zone = "us-east-1a"
#   tags = {
#     Name = var.vpn_name
#   }
# }

# resource "aws_vpn_gateway_attachment" "vpn_attachment" {
#   vpc_id         = aws_vpc.vpn_vpc.id
#   vpn_gateway_id = aws_vpn_gateway.my_vpn.id
# }

# #### Create these resources after the inital apply to get the public IP address and to avoid crazy errors

# resource "aws_customer_gateway" "customer_gateway" {
#   bgp_asn    = 65000
#   ip_address = "52.226.22.132" ## public IP address of the azure vpn gateway.. get after it is built
#   type       = "ipsec.1"

#   tags = {
#     Name = var.customer_gateway
#   }
# }


# resource "aws_vpn_connection" "main" {
#   vpn_gateway_id      = aws_vpn_gateway.my_vpn.id
#   customer_gateway_id = aws_customer_gateway.customer_gateway.id
#   type                = "ipsec.1"
#   static_routes_only  = true
#   tunnel_inside_ip_version = "ipv4"
#   tunnel1_preshared_key = "abc123dsfjkl34"
#   tunnel2_preshared_key = "abc1234ioeuiore"

#   local_ipv4_network_cidr = "10.0.4.0/27" ## use the cidr of the azure GatewaySubnet
#   tags = {
#     Name = var.vpn_connection
#   }
# }