provider "aws" {
  region = "ap-northeast-1"
}

locals {
  ports_01 = [80, 443]
  ports_02 = [22, 60022]
  ports_03 = [22, 80, 443, 60022]
}

resource "aws_security_group" "remote_sg_port_01" {
  name        = "remote_port_01"
  vpc_id      = "vpc-0c7fdd6b"
  description = "Test remote state"

  dynamic "ingress" {
    for_each = local.ports_01

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "remote_sg_port_02" {
  name        = "remote_port_02"
  vpc_id      = "vpc-0c7fdd6b"
  description = "Test remote state"

  dynamic "ingress" {
    for_each = local.ports_02

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "remote_sg_port_03" {
  name        = "remote_port_03"
  vpc_id      = "vpc-0c7fdd6b"
  description = "Test remote state"

  dynamic "ingress" {
    for_each = local.ports_03

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
