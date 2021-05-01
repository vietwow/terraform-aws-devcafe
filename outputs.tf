## VPC OUTPUTS

# VPC
output "vpc_id" {
  value = aws_vpc.this.id
}

output "vpc_ipv4_cidr_block" {
  value = aws_vpc.this.cidr_block
}

output "vpc_ipv6_cidr_block" {
  value = aws_vpc.this.ipv6_cidr_block
}

# Subnets

output "public_subnet_id" {
  value = aws_subnet.public.*.id
}

output "public_subnet_cidr" {
  value = aws_subnet.public.*.cidr_block
}

output "private_subnet_id" {
  value = aws_subnet.public.*.id
}

output "private_subnet_cidr" {
  value = aws_subnet.private.*.cidr_block
}

# Default vpc security group

output "default_security_group_id" {
  value = aws_default_security_group.this.id
}
