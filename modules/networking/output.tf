output "vpc_id" {
  value = aws_vpc.default.id
}

output "private_subnets" {
  value = aws_subnet.default_private.*.id
}

output "public_subnets" {
  value = aws_subnet.default_public[0].id
}

