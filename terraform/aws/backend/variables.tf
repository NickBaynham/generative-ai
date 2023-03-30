variable "region" {
  type        = string
  description = "The target region of the project"
}

variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket for tf state backend"
}