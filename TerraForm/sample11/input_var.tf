provider "aws" {
  region = "ap-northeast-1"
}

data "terraform_remote_state" "remote_var_input" {
  backend = "s3"

  config = {
    bucket = "s3-fsi-terraform-state"
    key    = "tfstate/tfxx-sample10.tfstate"
    region = "ap-northeast-1"
  }
}

output "INPUT_VAR_01" {
  value = data.terraform_remote_state.remote_var_input.outputs.OUTPUT_VAR_01 == "hogehogefoobar" ? "hello_world" : "Not_Select"
}

output "INPUT_VAR_02" {
  value = data.terraform_remote_state.remote_var_input.outputs.OUTPUT_VAR_02
}

output "INPUT_VAR_03" {
  value = data.terraform_remote_state.remote_var_input.outputs.OUTPUT_VAR_03
}

