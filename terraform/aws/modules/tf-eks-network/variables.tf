variable "project" {
  description = "The name of the project."
  type        = string
}

variable "environment" {
  description = "The target environment, i.e.: test, dev, prod."
  type        = string
}

variable "tags" {
  description = "Maps of tags."
  type        = map(string)
  default     = {}
}

############## Start: NETWORK ######################

variable "vpc_cidr_block" {
  description = "CIDR block to vpc1."
  type        = string
}

variable "subnet_public_cidr_blocks" {
  description = "CIDR blocks for the public subnet(s)."
  type        = list(string)
}

variable "subnet_private_cidr_blocks" {
  description = "The CIDR blocks for the private subnet(s)."
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