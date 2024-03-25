
variable "vpc_cidr" {}
variable "vpc_name" {}
variable "gw_sub_cidr" {}
variable "pub_sub1_cidr" {}
variable "security_group_name" {}
variable "linux_ami" {
  description = "default ami for instance"
  default = "ami-0a3c3a20c09d6f377"
  type = string
}

variable "instance_type" {
  description = "default instance type"
  default = "t2.micro"
  type = string
}

# variable "vpn_gateway_id" {
#   description = "aws vpn gateway id"
#   type = string
# }



