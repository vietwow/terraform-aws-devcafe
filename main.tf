## CREATE VPC

resource "aws_vpc" "this" {

  cidr_block           = var.cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = merge(
    {
      "Name" = local.vpc_name,
    },
    var.tags,
  )
}


resource "aws_default_security_group" "this" {
  vpc_id = aws_vpc.this.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

## CREATE SUBNETS

# Public subnets
resource "aws_subnet" "public" {
  count = local.number_of_subnets

  vpc_id = aws_vpc.this.id

  cidr_block        = var.public_subnets[count.index]
  availability_zone = data.aws_availability_zones.this.names[count.index]

  map_public_ip_on_launch = true

  tags = merge(
    {
      "Name" = "${local.public_subnet_name}(${count.index + 1})"
    },
    var.tags,
  )
}

# Private subnets
resource "aws_subnet" "private" {
  count = local.number_of_subnets

  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = data.aws_availability_zones.this.names[count.index]

  map_public_ip_on_launch = false

  tags = merge(
    {
      "Name" = "${local.private_subnet_name}(${count.index + 1})"
    },
    var.tags,
  )
}


## CREATE INTERNET GATEWAY

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = merge(
    {
      "Name" = local.igw_name
    },
    var.tags,
  )
}

# ## CREATE NAT GATEWAY

resource "aws_eip" "private" {
  count = local.number_of_subnets
  vpc   = true
}

resource "aws_nat_gateway" "private" {
  count         = local.number_of_subnets
  allocation_id = element(aws_eip.private.*.id, count.index)
  subnet_id     = element(aws_subnet.public.*.id, count.index)
}


## CREATE ROUTE TABLES

resource "aws_route_table" "public" {
  count = local.number_of_subnets

  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = merge(
    {
      "Name" = "${local.public_rtb_name}-${count.index + 1}"
    },
    var.tags,
  )
}

resource "aws_route_table" "private" {
  count = local.number_of_subnets

  vpc_id = aws_vpc.this.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.private.*.id, count.index)
  }

  tags = merge(
    {
      "Name" = "${local.private_rtb_name}-${count.index + 1}"
    },
    var.tags,
  )
}

## ROUTE TABLE ASSOCIATION

resource "aws_route_table_association" "public" {
  count = local.number_of_subnets

  route_table_id = element(aws_route_table.public.*.id, count.index)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
}

resource "aws_route_table_association" "private" {
  count = local.number_of_subnets

  route_table_id = element(aws_route_table.private.*.id, count.index)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
}

