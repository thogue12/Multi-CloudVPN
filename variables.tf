
### AWS VARIABLES

variable "vpc_cidr" {}
variable "vpc_name" {}
variable "gw_sub_cidr" {}
variable "pub_sub1_cidr" {}
variable "security_group_name" {}
variable "linux_ami" {
  description = "default ami for instance"
  default     = "ami-0a3c3a20c09d6f377"
  type        = string
}
variable "instance_type" {
  description = "default instance type"
  default     = "t2.micro"
  type        = string
}

### AWS VPN VARIABLES
variable "rg_name" {}


### AWS-VPN

variable "vpn_name" {}
variable "customer_gateway" {}
variable "vpn_connection" {}
variable "preshared_key1" {
  sensitive = true
}
variable "preshared_key2" {
  sensitive = true
}




#### Azure VARIABLES
variable "vnet_cidr" {}
variable "rg_location" {}
variable "subnet1_name" {}
variable "sub1_cidr" {}
variable "vm_nic1_name" {}
variable "public_ip1" {}
variable "vm1_name" {}
variable "vnet_name" {}
variable "subnet2_name" {}
variable "priv_subnet1_name" {}
variable "sub2_cidr" {}
variable "private_sub1_cidr" {}

### AZURE VPN VARIABLES

variable "gateway_subent" {}
variable "gateway_sub_cidr" {}
variable "vpn_ip" {}
variable "local_ng_name" {}
variable "vnet_gateway_con_name" {}
variable "local_ng_name2" {}
variable "vnet_gateway_con_name2" {}

###---------------DB Variables----------------------###

variable "db-username" {
  sensitive = true
}
variable "db-password" {
  sensitive = true
}

