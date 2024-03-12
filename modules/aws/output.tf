output "vpc_id" {
    value = aws_vpc.vpn_vpc.id
    description = "the id of the aws vpc"
}

output "public_route_table_id" {
  value = aws_route_table.example_pub_rt.id
  description = "the public route table of the vpc"
}