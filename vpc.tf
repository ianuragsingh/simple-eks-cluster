
locals {
  region = data.aws_region.current.name
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = ">3.18.0"

  create_vpc              = var.create_vpc
  name                    = var.vpc_name
  cidr                    = var.vpc_cidr
  
  azs                     = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
  private_subnets         = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets          = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_dns_hostnames    = true
  enable_dns_support      = true
  enable_nat_gateway      = true
  enable_vpn_gateway      = true
  map_public_ip_on_launch = true

  public_subnet_tags = {
    Name = "public subnet"
  }

  tags = {
    Name = var.vpc_name
  }
}
