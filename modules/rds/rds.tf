data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [ "${var.prefix}" ]
  }
}

data "aws_subnet" "subnet_private_1" {
  filter {
    name   = "tag:Name"
    values = [ "${var.prefix}-private-subnet-1" ]
  }
}

data "aws_subnet" "subnet_private_2" {
  filter {
    name   = "tag:Name"
    values = [ "${var.prefix}-private-subnet-2" ]
  }
}

resource "random_string" "db-password" {
  length  = 32
  upper   = false
  special = false
}

resource "aws_db_instance" "database" {   
  allocated_storage      = 10
  engine                 = "postgres"
  engine_version         = 13
  instance_class         = var.db_instance_class
  db_subnet_group_name   = aws_db_subnet_group.RDS_subnet_grp.name
  vpc_security_group_ids = ["${aws_security_group.rds.id}"]
  db_name                = var.db_name
  username               = var.db_user
  password               = random_string.db-password.result
  skip_final_snapshot    = true

  tags = local.common_tags
}


resource "aws_db_subnet_group" "RDS_subnet_grp" { 
  subnet_ids = ["${data.aws_subnet.subnet_private_1.id}", "${data.aws_subnet.subnet_private_2.id}"] 
}


resource "aws_security_group" "rds" {
  name = "rds-sg"
  vpc_id = data.aws_vpc.vpc.id
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    cidr_blocks = ["${var.VPC_cidr}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.common_tags

}
