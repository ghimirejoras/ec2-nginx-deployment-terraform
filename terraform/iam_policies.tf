# # /terraform/iam_policies.tf 

# data "aws_region" "current" {}
# data "aws_caller_identity" "current" {}

# # Backend policies (Least Privilege)

# resource "aws_iam_policy" "terraform_backend_policy" {
#   name        = "TerraformBackendPolicy"
#   description = "IAM Policy for tf to access s3 and DB!"

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect    = "Allow"
#         Principal = { "AWS" : "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root" }
#         Action = [
#           "s3:PutObject",
#           "s3:GetObject",
#           "s3:ListBucket",
#           "s3:DeleteBucket"
#         ],
#         Resource = [
#           "arn:aws:s3:::tf-state-bucket",
#           "arn:aws:s3:::tf-state-bucket/*"
#         ]
#       },
#       {
#         Effect = "Allow",
#         Action = [
#           "kms:Decrypt",
#           "kms:Encrypt",
#           "kms:GenerateDataKey",
#           "kms:DescribeKey"
#         ],
#         Resource = "*"
#       },
#       {
#         Effect = "Allow",
#         Action = [
#           "dynamodb:PutItem",
#           "dynamodb:GetItem",
#           "dynamodb:DeleteItem",
#           "dynamodb:Scan",
#           "dynamodb:Query"
#         ],
#         Resource = "arn:aws:dynamodb:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:table/terraform-locks"
#       }
#     ]
#   })
# }

# # IAM Role for tf backend

# resource "aws_iam_role" "terraform_role" {
#   name = "TerraformBackendRole"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Effect = "Allow",
#         Principal = {
#           Service = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/terraform-admin"
#         },
#         Action = "sts:AssumeRole"
#       }
#     ]
#   })
# }


# # Attach role policy

# resource "aws_iam_policy_attachment" "terraform_policy_attachment" {
#   role       = aws_iam_role.terraform_role
#   policy_arn = aws_iam_policy.terraform_backend_policy.arn
# }

# resource "aws_iam_user_role_attachment" "user_role_attachment" {
#   user       = var.user
#   policy_arn = aws_iam_policy.terraform_backend_policy
# }