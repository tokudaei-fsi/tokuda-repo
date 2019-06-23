provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "fsi" {
  ami                    = "ami-00d101850e971728d"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-052205af139934f76"]
  subnet_id              = "subnet-f60241bf"

  tags = {
    Name = "fsi@nametag"
  }
}
