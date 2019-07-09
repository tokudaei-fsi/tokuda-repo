provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  backend "s3" {
    region         = "ap-northeast-1"
    bucket         = "s3-fsi-terraform-state"
    key            = "tfstate/tfxx-sample13.tfstate"
    dynamodb_table = "fsi-tfstate-lock"
  }
}

resource "aws_db_instance" "import_rds" {
}

/*
resource "aws_db_instance" "import_rds" {
    allocated_storage                     = 20
    auto_minor_version_upgrade            = true
    availability_zone                     = "ap-northeast-1a"
    backup_retention_period               = 7
    backup_window                         = "16:47-17:17"
    copy_tags_to_snapshot                 = true
    db_subnet_group_name                  = "tf-subnet"
    deletion_protection                   = false
    enabled_cloudwatch_logs_exports       = []
    engine                                = "mysql"
    engine_version                        = "5.7.22"
    iam_database_authentication_enabled   = false
    identifier                            = "tf-import-db"
    instance_class                        = "db.t2.micro"
    iops                                  = 0
    license_model                         = "general-public-license"
    maintenance_window                    = "sat:19:20-sat:19:50"
    max_allocated_storage                 = 1000
    monitoring_interval                   = 60
    monitoring_role_arn                   = "arn:aws:iam::247042180376:role/rds-monitoring-role"
    multi_az                              = false
    option_group_name                     = "tf-op"
    parameter_group_name                  = "tf-para"
    performance_insights_enabled          = false
    performance_insights_retention_period = 0
    port                                  = 3306
    publicly_accessible                   = false
    security_group_names                  = []
    skip_final_snapshot                   = true
    storage_encrypted                     = false
    storage_type                          = "gp2"
    tags                                  = {}
    username                              = "root"
    vpc_security_group_ids                = [
        "sg-052205af139934f76",
    ]

    timeouts {}
}
*/
