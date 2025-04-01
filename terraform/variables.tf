# variables.tf 


variable "user" {
  default   = "terraform-admin"
  sensitive = true
}
variable "aws_region" {
  default   = "us-east-1"
  sensitive = true
}
/*

variable "aws_access_key_id" {
  sensitive = true
}

variable "aws_secret_access_key" {
  sensitive = true
}

*/


variable "ami_id" {
  default = "ami-0f9de6e2d2f067fca"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}
variable "subnet_cidr_block" {
  default = "10.0.1.0/24"
}
variable "availability_zone" {
  default = "us-east-1a"
}
variable "key_name" {}
variable "ebs_volume_size" {
  default = 10
}
>>>>>>> Stashed changes
variable "ebs_volume_type" {
  sensitive = true
}
variable "public_key_path" {
  sensitive = true
}
variable "filelocation_prtkey" {}

variable "destination" {
  sensitive = true

}



variable "ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}