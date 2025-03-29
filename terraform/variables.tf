# variables.tf 

variable "ami_id" {}
variable "instance_type" {}
variable "vpc_cidr_block" {}
variable "subnet_cidr_block" {}
variable "availability_zone" {}
variable "key_name" {}
variable "ebs_volume_size" {}
variable "ebs_volume_type" {
  sensitive = true
}
variable "public_key_path" {
  sensitive = true
}
variable "filelocation_prtkey" {}



variable "ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}