terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "recon_sg" {
  name        = "recon-experiment-sg"
  description = "Intentionally open SG to observe internet-facing scan/login attempts"

  ingress {
    description = "SSH from anywhere (experiment only)"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from anywhere (experiment only)"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "recon-experiment-sg"
    Purpose = "Unit1-CloudSecurity-PBL"
  }
}

resource "aws_instance" "recon_box" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_pair_name
  vpc_security_group_ids = [aws_security_group.recon_sg.id]

  tags = {
    Name    = "recon-experiment-box"
    Purpose = "Unit1-CloudSecurity-PBL"
  }
}

output "public_ip" {
  value       = aws_instance.recon_box.public_ip
  description = "Public IP of the recon instance (do not share this per assignment instructions)"
}

output "instance_id" {
  value = aws_instance.recon_box.id
}
