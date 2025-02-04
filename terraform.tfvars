
## AWS VARIABLES

vpc_cidr            = "172.0.0.0/16"
gw_sub_cidr         = "172.0.1.0/24"
pub_sub1_cidr       = "172.0.2.0/24"
priv_sub1_cidr      = "172.0.3.0/24"
priv_sub2_cidr      = "172.0.4.0/24"
vpc_name            = "tims-vpc"
security_group_name = "allow-web"

customer_gateway = "azure-customer-gateway"
vpn_connection   = "connect-azure-aws"
preshared_key1   = "abcsdh123789"
preshared_key2   = "abcsdh1283024"




## AZURE VARIABLES

vnet_cidr              = ["10.0.0.0/16"]
sub1_cidr              = ["10.0.1.0/24"]
sub2_cidr              = ["10.0.3.0/24"]
private_sub1_cidr      = ["10.0.4.0/24"]
gateway_sub_cidr       = ["10.0.2.0/24"]
rg_name                = "tims-vpn-rg"
rg_location            = "eastus"
vnet_name              = "vpn-vnet"
subnet1_name           = "pub-sub1"
subnet2_name           = "pub-sub2"
priv_subnet1_name      = "priv-sub1"
vm_nic1_name           = "vm-nic"
vm1_name               = "Linux-VM"
public_ip1             = "publicIP"
vpn_name               = "tim-vpn"
vpn_ip                 = "vpn-pub-IP"
gateway_subent         = "GatewaySubnet"
local_ng_name          = "aws-tunnel1"
vnet_gateway_con_name  = "connectoin1"
local_ng_name2         = "aws-tunnel2"
vnet_gateway_con_name2 = "connection2"


### -------------- DB VARIABLES------------------###

db-password = ""
db-username = ""
