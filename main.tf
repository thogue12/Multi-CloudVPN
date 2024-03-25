

module "aws" {
  source = "./modules/aws"

  vpc_cidr            = var.vpc_cidr
  vpc_name            = var.vpc_name
  gw_sub_cidr         = var.gw_sub_cidr
  pub_sub1_cidr       = var.pub_sub1_cidr
  security_group_name = var.security_group_name
  linux_ami           = var.linux_ami
  instance_type       = var.instance_type

}

module "azure" {
  source = "./modules/azure"

  rg_name      = var.rg_name
  vnet_name    = var.vnet_name
  subnet_name  = var.subnet_name
  location     = var.location
  vnet_cidr    = var.vnet_cidr
  sub1_cidr    = var.sub1_cidr
  vm1_name     = var.vm1_name
  vm_nic1_name = var.vm_nic1_name
  public_ip1   = var.public_ip1

}

module "vpn" {
  source = "./modules/vpn"

  gateway_subent         = var.gateway_subent
  az_vnet_name           = var.vnet_name
  az_rg_name             = var.rg_name
  gateway_sub_cidr       = var.gateway_sub_cidr
  vpn_ip                 = var.vpn_ip
  az_location            = var.location
  az_vpn_name            = var.vpn_name
  local_ng_name          = var.local_ng_name
  vnet_gateway_con_name  = var.vnet_gateway_con_name
  local_ng_name2         = var.local_ng_name2
  vnet_gateway_con_name2 = var.vnet_gateway_con_name2
  preshared_key1         = var.preshared_key1
  preshared_key2         = var.preshared_key2
  customer_gateway       = var.customer_gateway
  vpc_id                 = module.aws.vpc_id
  az_vnet_cidr           = var.vnet_cidr
  vpn_connection         = var.vpn_connection
  location               = var.location
  rg_name                = var.rg_name
  aws_route_table_id     = module.aws.public_route_table_id
  vpn_name               = var.vpn_name
  vpc_cidr_block         = module.aws.vpc_cidr_block
}