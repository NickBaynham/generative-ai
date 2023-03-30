terraform {
  required_version = "~> 1.4.2"
  backend "s3" {
    key = "global/s3/terraform.tfstate"
    encrypt        = true
  }
}