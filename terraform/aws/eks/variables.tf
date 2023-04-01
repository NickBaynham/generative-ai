variable "environment" {
  description = "The target environment, i.e.: test, dev, prod."
  type        = string
}

variable "region" {
  description = "The target region, i.e.: us-east-1."
  type        = string
}
variable "tags" {
  description = "Maps of tags."
  type        = map(string)
  default     = {}
}

############## Start: EKS ##########################

variable "cluster_name" {
  description = "Name of the EKS Cluster."
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes Version."
  type        = string
}

variable "cluster_instance_type" {
  description = "The EKS Cluster Instance Type for Nodes."
  type        = string
}

############## End: EKS ############################


############## Start: NETWORK ######################

variable "vpc_cidr_block" {
  description = "CIDR block to vpc1."
  type        = string
}

variable "subnet_public_cidr_block" {
  description = "CIDR block for the public subnet."
  type        = string
}

variable "subnet_private_cidr_block" {
  description = "CIDR block for the private subnet."
  type        = string
}

variable "address_allowed" {
  description = "IP addresses allowed for remote access."
}

############## End: NETWORK ######################

#variable "cluster_name" {
#  type        = string
#  description = "the name of the EKS cluster to provision"
#}
#
#variable "cluster_version" {
#  type        = string
#  description = "The supported EKS Kubernetes Version target of the cluster"
#}
#
#variable "instance_type" {
#  type        = string
#  description = "The instance type used to provision the EKS nodes"
#}
#
#variable "shared_credentials_file" {
#  type        = string
#  description = "The path to your ssh public key"
#}
#
#variable "vpc_cidr" {
#  type        = string
#  description = "The CIDR for the Virtual Private Cloud"
#  default     = "10.0.0.0/16"
#}
#
#variable "subnet_1_cidr" {
#  type        = string
#  description = "The CIDR value for subnet 1"
#  default     = "10.0.0.0/24"
#}
#
#variable "region" {
#  type        = string
#  description = "The target region for the EKS deployment"
#}
#
#variable "kube_config" {
#  type        = string
#  description = "The local path to the kube configuration"
#}