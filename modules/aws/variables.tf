
#variable for vpc cidr

variable "vpc_cidr" {
  description = "default cidr of the vpc"
  type = string
}


#variable for vpc id

variable "vpc_name" {
  description = "default name for the vpc"
  default = "aws-vpn-vpc"
  type = string
}

#variable for gateway subnet cidr

variable "gw_sub_cidr" {
  description = "default cidr of the gateway subnet defined in tfvars"
  type = string
}

#variable for public subnet1 cidr


variable "pub_sub1_cidr" {
  description = "default cidr of the public subnet1 defined in tfvars"
  type = string
}


#variable for security group name

variable "security_group_name" {
  description = "default name for the security group"
  default = "allow_web_traffic_and_ssh"
  type = string
}

#variable instance ami

variable "linux_ami" {
  description = "default ami for instance"
  default = "ami-0a3c3a20c09d6f377"
  type = string
}

#variable for instance type

variable "instance_type" {
  description = "default instance type"
  default = "t2.micro"
  type = string
}

variable "vpn_gateway_id" {
  description = "aws vpn gateway id"
  type = string
}



