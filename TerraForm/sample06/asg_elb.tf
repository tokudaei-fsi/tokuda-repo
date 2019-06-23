provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_security_group" "port80" {
  name   = "port80"
  vpc_id = "vpc-0c7fdd6b"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  description = "Test https port"
}

resource "aws_launch_configuration" "fsi_config" {
  image_id        = "ami-00d101850e971728d"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.port80.id]
}

resource "aws_elb" "fsi_elb" {
  name            = "fsi-tfXX-elb"
  subnets         = ["subnet-f60241bf", "subnet-3608b46d"]
  security_groups = [aws_security_group.port80.id]

  listener {
    lb_port           = 80
    lb_protocol       = "http"
    instance_port     = "80"
    instance_protocol = "http"
  }
}

resource "aws_autoscaling_group" "fsi_asg" {
  launch_configuration = aws_launch_configuration.fsi_config.id
  vpc_zone_identifier  = ["subnet-f60241bf", "subnet-3608b46d"]

  load_balancers = [aws_elb.fsi_elb.name]

  min_size = 2
  max_size = 2

  tag {
    key                 = "Name"
    value               = "tfXX@asg"
    propagate_at_launch = true
  }
}

