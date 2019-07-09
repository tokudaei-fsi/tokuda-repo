provider "aws" {
  region = "ap-northeast-1"
}

variable "output_var_str" {
  default = "hogehogefoobar"
}

variable "output_var_list" {
  type    = list(string)
  default = ["list01", "list02"]
}

variable "output_var_map" {
  type    = map(string)
  default = { key01 = "a", key02 = "b" }
}

output "OUTPUT_VAR_01" {
  value = var.output_var_str
}

output "OUTPUT_VAR_02" {
  value = var.output_var_list
}

output "OUTPUT_VAR_03" {
  value = var.output_var_map
}

