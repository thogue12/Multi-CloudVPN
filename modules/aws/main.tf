
#create a vpc
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "${var.vpc_name}-vpn"
  }
}

#subnet

resource "aws_subnet" "gateway_subnet" {
  cidr_block              = var.gw_sub_cidr
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1a"

  tags = {
    Name = "Gateway Subnet"
  }
  depends_on = [aws_vpc.main]
}

resource "aws_subnet" "public_subnet1" {
  cidr_block              = var.pub_sub1_cidr
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

   tags = {
    Name = "Public Subnet1"
  }
  depends_on = [aws_vpc.main]
}

#internet gateway

resource "aws_internet_gateway" "example_igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "vpn-vpc-internet-gateway"
  }

  
}

#route table
# add a route to the internet gateway
## Add a route in the route table to direct traffic destined for the Azure VNet CIDR block
### to the virtual private gateway (AWS VPN gateway)


resource "aws_route_table" "example_pub_rt" { 
  vpc_id = aws_vpc.main.id

  route {

    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.example_igw.id
   }
   tags = {
     Name = "vpn-public-route-table"
   }
}
##private route table
resource "aws_route_table" "example_priv_rt" { 
  vpc_id = aws_vpc.main.id

  route {

    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.example_igw.id
   }
   tags = {
     Name = "vpn-public-route-table"
   }
}

# #route table association1
resource "aws_route_table_association" "example_rt_asso1" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.example_pub_rt.id
}



#route table association2
resource "aws_route_table_association" "example_rt_asso2" {
  subnet_id      = aws_subnet.gateway_subnet.id
  route_table_id = aws_route_table.example_priv_rt.id
}

#create security group and allow ssh and http, https traffic from anywhere
resource "aws_security_group" "main_security_group" {
  name        = var.security_group_name
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id
  depends_on  = [aws_vpc.main]

  ingress {
    description = "allow https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    description = "allow icmp"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}



#create the EC2 instance

resource "aws_instance" "linux-vm1" {
  ami                    = var.linux_ami
  instance_type          = var.instance_type
  key_name               = "terraform-key"
  vpc_security_group_ids = [aws_security_group.main_security_group.id]
  subnet_id              = aws_subnet.public_subnet1.id

  tags = {
    Name = "Linux-Vm1"
  }
}



