variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "ami_id" {
  description = "AMI ID for the Linux instance (Amazon Linux 2023, region-specific)"
  type        = string
  default     = "ami-0f5ee92e2d63afc18" # verify/update for your region
}

variable "instance_type" {
  type    = string
  default = "t2.micro" # free-tier eligible
}

variable "key_pair_name" {
  description = "Name of an existing EC2 key pair for SSH access"
  type        = string
}
