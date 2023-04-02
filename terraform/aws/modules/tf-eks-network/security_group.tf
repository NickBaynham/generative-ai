# Create Security Group
resource "aws_security_group" "services" {
  name        = "${var.project}-sg"
  description = "AWS security group for terraform"
  vpc_id      = aws_vpc.gen1.id
  depends_on = [ aws_vpc.gen1 ]

  # Input
  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "TCP"
    self        = true
    cidr_blocks = [var.address_allowed, var.vpc_cidr_block]
  }

  # Output
  egress {
    from_port   = 0             # any port
    to_port     = 0             # any port
    protocol    = "-1"          # any protocol
    cidr_blocks = ["0.0.0.0/0"] # any destination
  }

  # ICMP Ping 
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = [var.address_allowed, var.vpc_cidr_block]
  }

  tags = merge(
    {
      Name = "${var.project}-sg",
    },
    var.tags,
  )
}