##AWS VARIABLES

#variable for vpc cidr

variable "vpc_cidr" {
  description = "default cidr of the vpc"
  default     = "10.0.0.0/16"
  type        = string
}

#variable for vpc id

variable "vpc_name" {
  description = "default name for the vpc"
  default     = "aws-vpn-vpc"
  type        = string
}

#variable for gateway subnet cidr

variable "gw_sub_cidr" {
  description = "default cidr of the gateway subnet"
  default     = "10.0.1.0/24"
  type        = string
}

#variable for public subnet1 cidr


variable "pub_sub1_cidr" {
  description = "default cidr of the public subnet1"
  default     = "10.0.0.0/24"
  type        = string
}


#variable for security group name

variable "security_group_name" {
  description = "default name for the security group"
  default     = "allow_web_traffic_and_ssh"
  type        = string
}

#variable instance ami

variable "linux_ami" {
  description = "default ami for instance"
  default     = "ami-0a3c3a20c09d6f377"
  type        = string
}

#variable for instance type

variable "instance_type" {
  description = "default instance type"
  default     = "t2.micro"
  type        = string
}

##VPN

variable "vpn_name" {
  description = "default name of the VPN, change in the main terraform.tfvars file"
  default     = "AWS_VPN-Gateway"
  type        = string
}

variable "customer_gateway" {
  description = "default name of the customer gateway, change in the main terraform.tfvars file"
  default     = "aws_azure"
  type        = string
}

variable "vpn_connection" {
  description = "default name of the vpn connection, change in the main terraform.tfvars file"
  default     = "aws_azure_connection"
  type        = string
}



##AZURE VARIABLES

variable "rg_name" {
  type        = string
  description = "name of the resource group, give value in the terraform.tfvars file"
  default     = "vpn_rg"

}

variable "location" {
  type        = string
  description = "location of the resource group, give value in the terraform.tfvars file"
  default     = "eastus"

}

variable "az_location" {
  type        = string
  description = "location of the resource group, give value in the terraform.tfvars file"
  default     = "eastus"

}

variable "vnet_name" {
  type        = string
  description = "name of the virtual network, give value in the terraform.tfvars file"
  default     = "vpn_vnet"

}

variable "vnet_cidr" {
  type        = list(string)
  description = "vnet CIDR, give value in the terraform.tfvars file"

}

variable "subnet_name" {
  type        = string
  description = "name of subnet1, give value in the terraform.tfvars file"
  default     = "public_subnet1"

}


variable "gateway_subent" {
  type        = string
  description = "name of the subnet, give value in the terraform.tfvars file"
  default     = "GatewaySubnet"

}


variable "sub1_cidr" {
  type        = list(string)
  description = "subnet1 CIDR, give value in the terraform.tfvars file"

}


variable "gateway_sub_cidr" {
  type        = list(string)
  description = "subnet1 CIDR, give value in the terraform.tfvars file"

}


variable "vm_nic1_name" {
  type        = string
  description = "name of Nic1 for vm1, give value in the terraform.tfvars file"
  default     = "vm1_nic"

}

variable "public_ip1" {
  type        = string
  description = "name of the public IP for vm1, give value in the terraform.tfvars file"
  default     = "VM1_public_IP"

}

variable "vm1_name" {
  type        = string
  description = "name of the virtual machine 1, give value in the terraform.tfvars file"
  default     = "vm-1"

}


#VPN

variable "az_vpn_name" {
  type        = string
  description = "name of the azure vpn gateway"
  default     = "vpn_azure_aws"

}

variable "vpn_ip" {
  type        = string
  description = "name of the azure vpn public IP"
  default     = "vpn_azure_aws_IP"

}

variable "local_ng_name" {
  type        = string
  description = "name of the azure local network gateway"
  default     = "local_azure_aws_tunnel1"

}

variable "local_ng_name2" {
  type        = string
  description = "name of the azure local network gateway"
  default     = "local_azure_aws_tunnel2"

}

variable "vnet_gateway_con_name" {
  type        = string
  description = "name of the azure local network gateway"
  default     = "azure_aws_connection"

}

variable "vnet_gateway_con_name2" {
  type        = string
  description = "name of the azure local network gateway"
  default     = "azure_aws_standy_connection"

}


