provider "aws" {
  region = "ap-northeast-1"
}

locals {
  local_ami_name = "ami-00d101850e971728d"
}

variable "name_tag" {
  default = "fsi@nametag"
}

data "template_file" "data_var" {
  template = file("data_var.tpl")

  vars = {
    data_var_val = "date template test"
  }
}

resource "aws_security_group" "https_port" {
  name   = "https_port"
  vpc_id = "vpc-0c7fdd6b"
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  description = "Test https port"
}

resource "aws_instance" "fsi" {
  ami                    = local.local_ami_name
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.https_port.id]
  subnet_id              = "subnet-f60241bf"

  tags = {
    Name     = var.name_tag
    Data_Var = data.template_file.data_var.rendered
  }
}

output "ec2_instanc_id" {
  value = aws_instance.fsi.id
}
