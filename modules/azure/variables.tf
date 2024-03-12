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

variable "vnet_cidr" {
    type = list(string)
    description = "vnet CIDR, give value in the terraform.tfvars file"
    
}

variable "subnet_name" {
    type = string
    description = "name of subnet1, give value in the terraform.tfvars file"
    default = "public_subnet1"
  
}

variable "subnet2_name" {
    type = string
    description = "name of subnet2, give value in the terraform.tfvars file"
    default = "public_subnet2"
  
}



variable "sub1_cidr" {
    type = list(string)
    description = "subnet1 CIDR, give value in the terraform.tfvars file"
    
}



variable "vm_nic1_name" {
    type = string
    description = "name of Nic1 for vm1, give value in the terraform.tfvars file"
    default = "vm1_nic"
  
}

variable "public_ip1" {
    type = string
    description = "name of the public IP for vm1, give value in the terraform.tfvars file"
    default = "VM1_public_IP"
  
}

variable "vm1_name" {
    type = string
    description = "name of the virtual machine 1, give value in the terraform.tfvars file"
    default = "vm1"
  
}

