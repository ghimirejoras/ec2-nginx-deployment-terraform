# terraform/backend.tf 

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92.0"
    }
  }

  backend "s3" {
    bucket         = ""
    key            = ""
    region         = ""
    encrypt        = ""
    dynamodb_table = ""
  }
}