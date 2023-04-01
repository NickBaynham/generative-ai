variable "target_region" {
  type        = string
  description = "The target region to deploy the EKS Cluster"
}

variable "cluster_name" {
  type        = string
  description = "the name of the EKS cluster to provision"
}

variable "cluster_version" {
  type        = string
  description = "The supported EKS Kubernetes Version target of the cluster"
}

variable "instance_type" {
  type        = string
  description = "The instance type used to provision the EKS nodes"
}

 variable "subnet_ids" {
   description = "A list of EKS Cluster Subnet Ids."
   type        = list(string)
 }