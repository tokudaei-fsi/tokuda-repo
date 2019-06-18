provider "aws" {
  region = "ap-northeast-1"
}

module "fsi_ec2_mod" {
  source = "../module/ec2/"

  subnet_id  = "subnet-3608b46d"
  monitoring = true
  tag_name   = "update_tag_name!"
}
