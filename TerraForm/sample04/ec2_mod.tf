provider "aws" {
  region = "ap-northeast-1"
}

module "fsi_ec2_mod" {
  source  = "../module/ec2/"
}
