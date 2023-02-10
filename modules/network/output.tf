output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "vpc_cidr" {
  value = var.vpc_cidr
}

output "subnet_public_1_id" {
  value = aws_subnet.subnet_public_1.id
}

output "subnet_public_2_id" {
  value = aws_subnet.subnet_public_2.id
}

output "subnet_private_1_id" {
  value = aws_subnet.subnet_private_1.id
}

output "subnet_private_2_id" {
  value = aws_subnet.subnet_private_2.id
}
