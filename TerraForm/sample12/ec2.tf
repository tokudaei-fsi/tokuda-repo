provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  backend "s3" {
    region         = "ap-northeast-1"
    bucket         = "s3-fsi-terraform-state"
    key            = "tfstate/tfxx-sample12.tfstate"
    dynamodb_table = "fsi-tfstate-lock"
  }
}

resource "aws_instance" "import_ec2" {
}

/*
resource "aws_instance" "import_ec2" {
    ami                          = "ami-0c3fd0f5d33134a76"
    associate_public_ip_address  = true
    availability_zone            = "ap-northeast-1a"
    cpu_core_count               = 1
    cpu_threads_per_core         = 1
    disable_api_termination      = false
    ebs_optimized                = false
    get_password_data            = false
    iam_instance_profile         = "TFAdminRole"
    instance_type                = "t2.micro"
    ipv6_address_count           = 0
    ipv6_addresses               = []
    key_name                     = "tf-key"
    monitoring                   = false
    private_ip                   = "172.30.0.128"
    security_groups              = []
    source_dest_check            = true
    subnet_id                    = "subnet-f60241bf"
    tags                         = {
        "Name" = "import@ec2"
    }
    tenancy                      = "default"
    volume_tags                  = {
        "Name" = "import@ec2"
    }
    vpc_security_group_ids       = [
        "sg-052205af139934f76",
    ]

    credit_specification {
        cpu_credits = "standard"
    }

    root_block_device {
        delete_on_termination = true
        iops                  = 100
        volume_size           = 8
        volume_type           = "gp2"
    }

    timeouts {}
}
*/
