provider "aws" {
  region = "ap-northeast-1"
}

data "terraform_remote_state" "sg_state_input" {
  backend = "s3"

  config = {
    bucket = "s3-fsi-terraform-state"
    key    = "tfstate/common/sg2.tfstate"
    region = "ap-northeast-1"
  }
}

resource "aws_instance" "fsi" {
  ami                    = "ami-00d101850e971728d"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.terraform_remote_state.sg_state_input.outputs.remote_sg_port_03_id]
  subnet_id              = "subnet-f60241bf"

  tags = {
    Name = "remote@sg"
  }
}
