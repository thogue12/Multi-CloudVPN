
variable "vpc_id" {}
variable "aws_route_table_id" {}
variable "rg_name" {}
variable "rg_location" {}
variable "vpc_cidr_block" {}

##AWS-VPN

variable "vpn_name" {}

variable "customer_gateway" {}
variable "vpn_connection" {}

variable "preshared_key1" {
    sensitive = true
}
variable "preshared_key2" {
    sensitive = true
}


##Azure-VPN
variable "resource_group_name" {
  description = "The name of the Resource Group"
  type        = string
}
variable "gateway_subent" {}
variable "vnet_name" {}
# variable "az_rg_name" {}
variable "gateway_sub_cidr" {}
variable "vpn_ip" {}
variable "az_vpn_name" {}
variable "local_ng_name" {}
variable "vnet_gateway_con_name" {}
variable "local_ng_name2" {}
variable "vnet_gateway_con_name2" {}
variable "vnet_cidr" {}

