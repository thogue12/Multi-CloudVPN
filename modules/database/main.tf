resource "aws_db_instance" "this_db" {
  allocated_storage    = 10
  db_name              = "wordpress_database"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = var.db-username
  password             = var.db-password
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  multi_az = false
  db_subnet_group_name = aws_db_subnet_group.this_subnet_group.name
  vpc_security_group_ids = [aws_security_group.allow_mysql_traffic.id]
  
}

resource "aws_db_subnet_group" "this_subnet_group" {
  name       = "wordpress_db_subnet_group"
  subnet_ids = var.private_subnet_ids

  tags = {
    Name = "wordpress DB subnet group"
  }
}

resource "aws_security_group" "allow_mysql_traffic" {
  name        = "allow_mysql_traffic"
  description = "Allow MySQL inbound traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "allow_mysql_traffic"
  }
}

resource "aws_security_group_rule" "this_mysql_rule" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = var.vnet_cidr
  security_group_id = aws_security_group.allow_mysql_traffic.id
}

resource "aws_security_group_rule" "this_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks = ["::/0"]
  security_group_id = aws_security_group.allow_mysql_traffic.id
}