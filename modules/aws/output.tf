output "vpc_id" {
    value = aws_vpc.main.id
}

output "vpc_cidr_block" {
    value = var.vpc_cidr
}
output "public_route_table_id" {
  value = aws_route_table.example_pub_rt.id
}

output "public_subnet1_id" {
  value = aws_subnet.public_subnet1.id
}

output "gateway_subnet_id" {
  value = aws_subnet.gateway_subnet.id
}
