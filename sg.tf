#this SG is for ec2 instance on which we will run ecs
resource "aws_security_group" "ec2-sg" {
  name        = "webapp-ec2"
  description = "webapp"
  vpc_id      = data.aws_vpc.main.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "http"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Sg-for-ecs(ec2)"
  }
}
# the below security group is for aws ALB
resource "aws_security_group" "lb" {
  name   = "webapp-lb"
  vpc_id = data.aws_vpc.main.id
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "env"       = "test"
  }
}
