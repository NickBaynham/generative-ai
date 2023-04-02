variable "project_name" {
  description = "The name of the project."
  type        = string
}

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

variable "subnet_public_cidr_blocks" {
  description = "CIDR blocks for the public subnets."
  type        = list(string)
}

variable "subnet_private_cidr_blocks" {
  description = "CIDR blocks for the private subnets."
  type        = list(string)
}

variable "address_allowed" {
  description = "IP addresses allowed for remote access."
}

############## End: NETWORK ######################

#variable "shared_credentials_file" {
#  type        = string
#  description = "The path to your ssh public key"
#}
#variable "kube_config" {
#  type        = string
#  description = "The local path to the kube configuration"
#}