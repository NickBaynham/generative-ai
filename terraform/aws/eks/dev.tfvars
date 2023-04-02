project_name = "gen1"
environment = "dev"
region      = "us-east-1"

cluster_name          = "gen1_dev"
cluster_version       = "1.24"
cluster_instance_type = "t2.small"

vpc_cidr_block            = "10.0.0.0/16"
subnet_public_cidr_blocks  = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]
subnet_private_cidr_blocks = ["10.0.40.0/24", "10.0.50.0/24", "10.0.60.0/24"]

tags = {
  Scost       = "generative_ai",
  Terraform   = "true",
  Environment = "dev",
  Project     = "gen1"
}

address_allowed = "98.170.151.75/32"