variable "ami" {
  description = "ID of AMI to use for the instance"
  default     = "ami-00d101850e971728d"
}

variable "instance_type" {
  description = "The type of instance to start"
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  default     = "subnet-f60241bf"
}

variable "key_name" {
  description = "The key name to use for the instance"
  default     = "tf-key"
}

variable "monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  default     = false
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = ["sg-052205af139934f76"]
}

variable "tag_name" {
  description = "The Tagging of Name tag"
  default     = "tf_module@ec2"
}
