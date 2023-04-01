module "eks_network" {
  source                    = "../modules/tf-eks-network"
  address_allowed           = var.address_allowed
  environment               = var.environment
  subnet_private_cidr_block = var.subnet_private_cidr_block
  subnet_public_cidr_block  = var.subnet_public_cidr_block
  vpc_cidr_block            = var.vpc_cidr_block
}

module "eks_cluster" {
  source          = "../modules/tf-eks-cluster"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  instance_type   = var.cluster_instance_type
  target_region   = var.region
  subnet_ids = [
    module.eks_network.private_subnet_id
  ]
}

#resource "aws_iam_role" "eks" {
#  name               = "gen1-eks"
#  assume_role_policy = <<EOF
#    {
#      "Version": "2012-10-17",
#      "Statement": [
#      {
#        "Effect": "Allow",
#        "Principal": {
#        "Service": "eks.amazonaws.com"
#     },
#     "Action": "sts:AssumeRole"
#    }
#      ]
#    }
#  EOF
#}

#resource "aws_iam_role_policy_attachment" "AmazonEKSClusterPolicy" {
#  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
#  role       = aws_iam_role.eks.name
#}
#
#resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly-EKS" {
#  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
#  role       = aws_iam_role.eks.name
#}

#resource "aws_eks_cluster" "eks-cluster-remove-me-tf-eks-cluster-network" {
# name = "devopsthehardway-cluster"
# role_arn = aws_iam_role.eks-cluster-remove-me-tf-eks-cluster-network.arn
#
# vpc_config {
#  subnet_ids = [var.subnet_id_1, var.subnet_id_2]
# }
#
# depends_on = [
#  aws_iam_role.eks-cluster-remove-me-tf-eks-cluster-network,
# ]
#}

#module "aws" {
#  source                  = "../modules/aws/tf-aws"
#  target_region           = var.region
#  shared_credentials_file = var.shared_credentials_file
#  cluster_name            = ""
#  cluster_version         = ""
#  instance_type           = ""
#  kube_config             = ""
#  region                  = ""
#}

#module "tf-eks-cluster-cluster-remove-me-tf-eks-cluster-network" {
#  source          = "../modules/aws/tf-eks-cluster-cluster-remove-me-tf-eks-cluster-network"
#  target_region   = var.region
#  cluster_name    = var.cluster_name
#  cluster_version = var.cluster_version
#  instance_type   = var.instance_type
#  kube_config     = ""
#  region          = ""
#  shared_credentials_file = ""
#}

#module "tf-dashboard" {
#  source       = "../modules/aws/tf-dashboard"
#  cluster_name = module.tf-eks-cluster-cluster-remove-me-tf-eks-cluster-network.README.md-name # Ensures that the README.md is created before the dashboard
#  kubectl_id   = module.tf-eks-cluster-cluster-remove-me-tf-eks-cluster-network.kubectl
#}