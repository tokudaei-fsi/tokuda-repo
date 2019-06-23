provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_security_group" "rds_aurora" {
  name   = "rds_aurora"
  vpc_id = "vpc-0c7fdd6b"
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  description = "Test RDS Aurora"
}

resource "aws_db_parameter_group" "fsi_aurora_para" {
  name   = "fsi-tfxx-aurora-db-parameter-group"
  family = "aurora5.6"
}

resource "aws_rds_cluster_parameter_group" "fsi_aurora_clus_para" {
  name   = "fsi-tfxx-aurora-cluseter-parameter-group"
  family = "aurora5.6"
}

resource "aws_db_subnet_group" "fsi_aurora_subnet" {
  name       = "fsi-aurora-db-subnet-group"
  subnet_ids = ["subnet-f60241bf", "subnet-3608b46d"]
}

resource "aws_rds_cluster" "fsi_aurora_cluster" {
  cluster_identifier              = "fsi-tfxx-aurora"
  master_username                 = "root"
  master_password                 = "TFfsi123!"
  backup_retention_period         = 5
  preferred_backup_window         = "21:00-21:30"
  preferred_maintenance_window    = "wed:22:15-wed:22:45"
  port                            = 3306
  vpc_security_group_ids          = [aws_security_group.rds_aurora.id]
  db_subnet_group_name            = aws_db_subnet_group.fsi_aurora_subnet.name
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.fsi_aurora_clus_para.name
  skip_final_snapshot             = true

  tags = {
    Name = "tfxx@aurora"
  }
}

resource "aws_rds_cluster_instance" "fsi_aurora_ins" {
  identifier              = "fsi-tfxx-aurora"
  cluster_identifier      = aws_rds_cluster.fsi_aurora_cluster.id
  instance_class          = "db.t2.small"
  db_subnet_group_name    = aws_db_subnet_group.fsi_aurora_subnet.name
  db_parameter_group_name = aws_db_parameter_group.fsi_aurora_para.name

  tags = {
    Name = "tfxx@aurora"
  }
}

