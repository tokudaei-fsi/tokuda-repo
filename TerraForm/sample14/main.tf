provider "aws" {
  region = "ap-northeast-1"
}

variable "AZ" {
  default = "AZa"
}

variable "crete_ec2" {
  default = true
}

locals {
  ports = [22, 80, 443, 60022]
}

resource "aws_security_group" "dynamic_test_sg" {
  name        = "dynamic_test_sg_01"
  vpc_id      = "vpc-0c7fdd6b"
  description = "Test Dynamic for each"

  dynamic "ingress" {
    for_each = local.ports

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

resource "aws_instance" "tfxx_ec2" {
  count                  = var.crete_ec2 == true ? 1 : 0
  depends_on             = ["aws_security_group.dynamic_test_sg"]
  ami                    = "ami-00d101850e971728d"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.dynamic_test_sg.id]
  subnet_id              = var.AZ == "AZa" ? "subnet-f60241bf" : "subnet-3608b46d"

  tags = {
    Name = "tfxx@sample14"
  }
}

module "target_test" {
  source   = "../module/ec2/"
  tag_name = "target_test!"
}
