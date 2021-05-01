locals {

  number_of_subnets = max(
    length(var.public_subnets),
    length(var.private_subnets),
  )

  vpc_name            = "${lower(replace(var.name, " ", "-"))}-vpc"
  igw_name            = "${lower(replace(var.name, " ", "-"))}-igw"
  public_subnet_name  = "${lower(replace(var.name, " ", "-"))}-public-subnet-az"
  private_subnet_name = "${lower(replace(var.name, " ", "-"))}-private-subnet-az"
  public_rtb_name     = "${lower(replace(var.name, " ", "-"))}-public-rtb"
  private_rtb_name    = "${lower(replace(var.name, " ", "-"))}-private-rtb"
}
