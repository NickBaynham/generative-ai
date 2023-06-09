# Reference:
# https://github.com/glaucius/aws-terraform
# https://www.terraform.io/docs/providers/aws/d/route_table.html
# https://www.terraform.io/docs/providers/aws/d/route.html
# https://github.com/iaasweek/terraform

# Create route custom for public subnet
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.gen1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge(
    {
      Name = "route, public1, gateway, aws, vpc1",
    },
    var.tags,
  )
}

# Create route Access
#resource "aws_route" "internet_access" {
#  route_table_id         = aws_vpc.vpc_testing.route_table_subnet_public1
#  destination_cidr_block = "0.0.0.0/0"
#  gateway_id             = aws_internet_gateway.igw1.id
#}

# Associate route for public subnets
resource "aws_route_table_association" "public" {
  count          = length(var.subnet_public_cidr_blocks)
  subnet_id      = element(aws_subnet.gen1_public[*].id, count.index)
  route_table_id = element(aws_route_table.public[*].id, count.index)
}


# Create route custom for private subnets
resource "aws_route_table" "private" {
  count  = length(var.subnet_private_cidr_blocks)
  vpc_id = aws_vpc.gen1.id

  route {
    cidr_block     = "0.0.0.0/0" //associated subnet can reach everywhere
    nat_gateway_id = element(aws_nat_gateway.gen1_nat[*].id, count.index)
  }

  tags = merge(
    {
      Name = "${var.project}-private-route-${count.index}",
    },
    var.tags,
  )
}

# Associate route for private subnet
resource "aws_route_table_association" "private" {
  count          = length(var.subnet_private_cidr_blocks)
  subnet_id      = element(aws_subnet.gen1_private[*].id, count.index)
  route_table_id = element(aws_route_table.private[*].id, count.index)
}