

module "aws" {
  source = "./modules/aws"

  vpc_cidr            = var.vpc_cidr
  vpc_name            = var.vpc_name
  gw_sub_cidr         = var.gw_sub_cidr
  pub_sub1_cidr       = var.pub_sub1_cidr
  security_group_name = var.security_group_name
  linux_ami           = var.linux_ami
  instance_type       = var.instance_type
  priv_sub1_cidr      = var.priv_sub1_cidr
  priv_sub2_cidr      = var.priv_sub2_cidr
  vpn_gateway_id      = module.vpn.vpn_gateway_id
  vnet_cidr           = module.azure.vnet_cidr

}

module "azure" {
  source = "./modules/azure"

  rg_name           = var.rg_name
  vnet_name         = var.vnet_name
  subnet1_name      = var.subnet1_name
  rg_location       = var.rg_location
  vnet_cidr         = var.vnet_cidr
  sub1_cidr         = var.sub1_cidr
  vm1_name          = var.vm1_name
  vm_nic1_name      = var.vm_nic1_name
  public_ip1        = var.public_ip1
  sub2_cidr         = var.sub2_cidr
  private_sub1_cidr = var.private_sub1_cidr
  subnet2_name      = var.subnet2_name
  priv_subnet1_name = var.priv_subnet1_name
  vpc_cidr_block = module.aws.vpc_cidr_block

}

module "vpn" {
  source = "./modules/vpn"

  resource_group_name    = module.azure.resource_group_name
  rg_name                = var.rg_name
  rg_location            = module.azure.rg_location
  vnet_name              = module.azure.vnet_name
  gateway_subent         = var.gateway_subent
  gateway_sub_cidr       = var.gateway_sub_cidr
  vpn_ip                 = var.vpn_ip
  az_vpn_name            = var.vpn_name
  vnet_cidr              = module.azure.vnet_cidr
  vpn_connection         = var.vpn_connection
  vnet_gateway_con_name  = var.vnet_gateway_con_name
  vnet_gateway_con_name2 = var.vnet_gateway_con_name2

  local_ng_name      = var.local_ng_name
  local_ng_name2     = var.local_ng_name2
  preshared_key1     = var.preshared_key1
  preshared_key2     = var.preshared_key2
  customer_gateway   = var.customer_gateway
  vpc_id             = module.aws.vpc_id
  vpc_cidr_block     = module.aws.vpc_cidr_block
  aws_route_table_id = module.aws.public_route_table_id
  vpn_name           = var.vpn_name

}
module "database" {
  source             = "./modules/database"
  db-username        = var.db-username
  db-password        = var.db-password
  private_subnet_ids = module.aws.private_subnet_ids
  vpc_id             = module.aws.vpc_id
  vnet_cidr          = module.azure.vnet_cidr
}