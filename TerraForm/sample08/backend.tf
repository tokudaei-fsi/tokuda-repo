terraform {
  backend "s3" {
    region         = "ap-northeast-1"
    bucket         = "s3-fsi-terraform-state"
    key            = "tfstate/tfxx-ec2.tfstate"
    dynamodb_table = "fsi-tfstate-lock"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "fsi_backend" {
  ami                    = "ami-00d101850e971728d"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-052205af139934f76"]
  subnet_id              = "subnet-f60241bf"

  tags = {
    Name = "fsi@backend"
  }
}
