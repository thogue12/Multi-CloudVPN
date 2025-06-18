# Multi-Cloud-VPN

This project establishes a secure **Multi-Cloud VPN connection between AWS and Azure**, enabling seamless communication across both cloud environments. Built entirely using **Terraform** and **modular infrastructure**, this solution connects workloads across cloud boundaries—laying the groundwork for highly available, hybrid-cloud architectures.

## 🌐 Project Overview

The goal was to securely link an **Azure Virtual Network** with an **AWS VPC**, creating a private tunnel that enables services in each cloud to communicate. This was tested by deploying:
- A **WordPress application** on an **Azure VM**
- A **MySQL RDS database** in **AWS**

The project demonstrates core platform engineering skills across **cloud networking, automation, infrastructure modularity**, and secure connectivity.

## 🔧 Key Features

- **Cloud Interconnectivity**
  - Azure → AWS site-to-site VPN
  - IPsec/IKE configuration via Terraform
- **Compute Resources**
  - Azure Linux VM (WordPress host)
  - AWS EC2 (optional testing)
- **Data Services**
  - AWS RDS (MySQL) with restricted private access
- **IaC Implementation**
  - Fully modular Terraform structure
  - Reusable modules for VPC/VNet, subnets, VPN Gateways, route tables
- **Planned Automation**
  - Ansible playbooks to automate WordPress deployment and DB integration (WIP)

## 🧠 Skills Demonstrated

- Terraform Modules (reusable infrastructure design)
- Site-to-Site VPN (Azure Local Network Gateway + AWS Virtual Private Gateway)
- Private Networking (subnetting, route propagation, BGP basics)
- Multi-cloud Infrastructure as Code
- Secure connectivity testing and validation
- Terraform documentation and variable design

## How to run 

main.tf
- terraform init
- terraform plan
- terraform apply
