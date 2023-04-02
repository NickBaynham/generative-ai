output "vpc_id" {
  value = aws_vpc.gen1.id
}

output "private_subnet_ids" {
  value = aws_subnet.gen1_private[*].id
}

output "public_subnet_ids" {
  value = aws_subnet.gen1_public[*].id
}

output "default_sg_id" {
  value = aws_internet_gateway.igw.id
}