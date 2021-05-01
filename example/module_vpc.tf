provider "aws" {
  region = "ap-northeast-1"
}

module "vpc" {
  source = "../"

  cidr_block      = "192.168.0.0/16"
  public_subnets  = ["192.168.1.0/24", "192.168.2.0/24"]
  private_subnets = ["192.168.4.0/24", "192.168.5.0/24"]

  tags = {}
}
