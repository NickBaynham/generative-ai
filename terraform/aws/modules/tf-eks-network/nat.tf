# Reference: 
# https://github.com/glaucius/aws-terraform
# https://www.terraform.io/docs/providers/aws/r/nat_gateway.html
# https://www.terraform.io/docs/providers/aws/d/internet_gateway.html

# Create Internet Nat Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.gen1.id

  tags = merge(
    {
      Name = "router, gateway, aws, vpc",
    },
    var.tags,
  )
}

# Create Elastic IP for NAT Gateway
resource "aws_eip" "nat" {
  vpc      = true

  tags = merge(
    {
      Name = "nat, gateway, aws, vpc",
    },
    var.tags,
  )
}

# Create NAT Gateway
resource "aws_nat_gateway" "gen1_nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.gen1_private.id
  depends_on    = [ aws_internet_gateway.igw ]

  tags = merge(
    {
      Name = "nat, gateway, aws, vpc",
    },
    var.tags,
  )
}