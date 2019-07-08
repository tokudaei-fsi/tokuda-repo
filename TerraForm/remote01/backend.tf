terraform {
  backend "s3" {
    region         = "ap-northeast-1"
    bucket         = "s3-fsi-terraform-state"
    key            = "tfstate/common/sg.tfstate"
    dynamodb_table = "fsi-tfstate-lock"
  }
}