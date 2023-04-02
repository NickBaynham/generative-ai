# References:
#   https://github.com/Sensedia/open-tools
#   https://github.com/glaucius/aws-terraform
#   https://www.terraform.io/docs/providers/aws/d/vpc.html
#   https://www.terraform.io/docs/providers/aws/d/subnet.html

# Check for correct workspace
data "local_file" "workspace_check" {
  count    = var.environment == terraform.workspace ? 0 : 1
  filename = "ERROR: Workspace does not match given environment name!"
}

# Provision a dedicated VPC
resource "aws_vpc" "gen1" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    {
      Name = "${var.project}-vpc",
    },
    var.tags,
  )
}

# Provision a public subnet
resource "aws_subnet" "gen1_public" {
  vpc_id                    = aws_vpc.gen1.id
  count                     = length(var.subnet_public_cidr_blocks)
  cidr_block                = element(var.subnet_public_cidr_blocks, count.index)
  map_public_ip_on_launch   = "true"
  availability_zone         = element(data.aws_availability_zones.available.names, count.index)

  tags = merge(
    {
      Name                     = "${var.project}-${element(data.aws_availability_zones.available.names, count.index)}-public-subnet",
      "kubernetes.io/role/elb" = "1"
    },
    var.tags,
  )
}

# Provision a private subnet
resource "aws_subnet" "gen1_private" {
  vpc_id                    = aws_vpc.gen1.id
  count                     = length(var.subnet_private_cidr_blocks)
  cidr_block                = element(var.subnet_private_cidr_blocks, count.index)
  map_public_ip_on_launch   = "false"
  availability_zone         = element(data.aws_availability_zones.available.names, count.index)

  tags = merge(
    {
      Name                              = "${var.project}-${element(data.aws_availability_zones.available.names, count.index)}-private-subnet",
      "kubernetes.io/role/internal-elb" = "1"
    },
    var.tags,
  )
}