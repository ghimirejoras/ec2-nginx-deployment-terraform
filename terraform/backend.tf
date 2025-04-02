# terraform/backend.tf 

terraform {
required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.92.0"
    }
}

backend "s3"
    bucket = "var.bucketname"
    key = terraform.tfstate 
    region = var.region
    encrypt = true 
}