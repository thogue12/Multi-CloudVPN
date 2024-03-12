
variable "vpc_id" {
    type = string
    description = "the id of the aws vpc"
    default = "aws_vpc.vpn_vpc.id"
  
}

variable "aws_route_table_id" {
  type        = string
  description = "aws route table to add vpn routes to"
}

variable "rg_name" {
    type = string
    description = "name of the resource group, give value in the terraform.tfvars file"
    default = "vpn_rg"
  
}

variable "location" {
    type = string
    description = "location of the resource group, give value in the terraform.tfvars file"
    default = "eastus"
  
}

variable "vnet_name" {
    type = string
    description = "name of the virtual network, give value in the terraform.tfvars file"
    default = "vpn_vnet"
  
}

##AWS-VPN

variable "vpn_name" {
  description = "default name of the VPN, change in the main terraform.tfvars file"
  default = "AWS_VPN-Gateway"
  type = string
}

variable "customer_gateway" {
  description = "default name of the customer gateway, change in the main terraform.tfvars file"
  default = "aws_azure"
  type = string
}

variable "vpn_connection" {
  description = "default name of the vpn connection, change in the main terraform.tfvars file"
  default = "aws_azure_connection"
  type = string
}

variable "preshared_key1" {
  description = "the default pre shared key for tunnel 1"
  default = "abc123dsfjkl34"
  type = string
}

variable "preshared_key2" {
  description = "the default pre shared key for tunnel 2"
  default = "abc1234ioeuiore"
  type = string
}


##Azure-VPN

variable "az_vpn_name" {
  type = string
  description = "name of the azure vpn gateway"
  default = "vpn_azure_aws"
  
}

variable "vpn_ip" {
  type = string
  description = "name of the azure vpn public IP"
  default = "vpn_IP"
  
}

variable "local_ng_name" {
  type = string
  description = "name of the azure local network gateway"
  default = "local_azure_aws_tunnel1"
  
}

variable "local_ng_name2" {
  type = string
  description = "name of the azure local network gateway"
  default = "local_azure_aws_tunnel2"
  
}

variable "vnet_gateway_con_name" {
  type = string
  description = "name of the azure local network gateway"
  default = "azure_aws_connection"
  
}

variable "vnet_gateway_con_name2" {
  type = string
  description = "name of the azure local network gateway"
  default = "azure_aws_standy_connection"
  
}

variable "gateway_subent" {
    type = string
    description = "name of the subnet, give value in the terraform.tfvars file"
    default = "GatewaySubnet"
  
}

variable "gateway_sub_cidr" {
    type = list(string)
    description = "subnet1 CIDR, give value in the terraform.tfvars file"
    
}

variable "az_rg_name" {
    type = string
    description = "name of the resource group, give value in the terraform.tfvars file"
    default = "vpn_rg"
  
}

variable "az_location" {
    type = string
    description = "location of the resource group, give value in the terraform.tfvars file"
    default = "eastus"
  
}

variable "az_vnet_name" {
    type = string
    description = "name of the virtual network, give value in the terraform.tfvars file"
    default = "vpn_vnet"
  
}

variable "az_vnet_cidr" {
    type = list(string)
    description = "vnet CIDR, give value in the terraform.tfvars file"
    
}