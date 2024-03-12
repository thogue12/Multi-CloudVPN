

module "aws" {
  source = "./modules/aws"

  vpc_cidr            = var.vpc_cidr
  vpc_name            = var.vpc_name
  gw_sub_cidr         = var.gw_sub_cidr
  pub_sub1_cidr       = var.pub_sub1_cidr
  security_group_name = var.security_group_name
  linux_ami           = var.linux_ami
  instance_type       = var.instance_type
  vpn_gateway_id      = module.vpn.vpn_gateway_id

}

module "azure" {
  source = "./modules/azure"
  
  rg_name      = var.rg_name
  vnet_name    = var.vnet_name
  vnet_cidr    = var.vnet_cidr
  sub1_cidr    = var.sub1_cidr
  vm1_name     = var.vm1_name
  vm_nic1_name = var.vm_nic1_name
  public_ip1   = var.public_ip1

}

module "vpn" {
  source             = "./modules/vpn"
  vpn_name           = var.vpc_name
  customer_gateway   = var.customer_gateway
  vpn_connection     = var.vpn_connection
  vpn_ip             = var.vpn_ip
  az_vpn_name        = var.az_vpn_name
  gateway_sub_cidr   = var.gateway_sub_cidr
  az_vnet_cidr       = var.vnet_cidr
  az_location        = var.az_location
  az_rg_name         = var.rg_name
  az_vnet_name       = var.vnet_name
  vpc_id             = module.aws.vpc_id
  aws_route_table_id = module.aws.public_route_table_id
}