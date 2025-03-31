# # /terraform/backend_s3_dynamodb.tf 

# # pull data form existing s3 bucket

# data "aws_s3_bucket" "old_bucket" {
#   bucket = "tf-state-bucket"
# }


# # pull data from existing dynamoDB

# data "aws_dynamodb_table" "old_dynamodb" {
#   name = "terraform-locks"
# }

# # create s3 bucket if it don't exist

# resource "aws_s3_bucket" "tf_state_bucket" {
#   count  = data.aws_s3_bucket.old_bucket.id != null ? 0 : 1
#   bucket = "tf-state-bucket"

#   versioning {
#     enabled = true
#   }

#   server_side_encryption_configuration {
#     rule {
#       apply_server_side_encryption_by_default {
#         sse_algorithm = "aws:kms"
#       }
#     }
#   }

#   lifecycle {
#     prevent_destroy = false
#   }
# }

# # create the dynamoDb if it don't exist

# resource "aws_dynamodb_table" "terraform_locks" {
#   count        = data.aws_dynamodb_table.old_dynamodb.id != null ? 0 : 1
#   name         = "terraform-locks"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }

#   point_in_time_recovery {
#     enabled = false
#   }

#   lifecycle {
#     prevent_destroy = false
#   }
# }


# terraform {
#   backend "s3" {
#     bucket       = "tf-state-bucket"
#     key          = "terraform.tfstate"
#     region       = "us-east-1"
#     encrypt      = true
#     use_lockfile = true
#     acl          = "bucket-owner-full-control"
#   }
# }