data "aws_ami" "ubuntu" {

  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}


data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [ "${var.prefix}" ]
  }
}


data "aws_subnet" "subnet_public_1" {
  filter {
    name   = "tag:Name"
    values = [ "${var.prefix}" ]
  }
}


resource "aws_instance" "ec2_instance" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.ec2_instance_type
  subnet_id              = data.aws_subnet.subnet_public_1.id
  vpc_security_group_ids = ["${aws_security_group.ec2.id}"]
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name 
  user_data              = templatefile("${path.module}/templates/ec2_userdata.tpl", {
    data = "foo+bar"
  })

  tags = local.common_tags

  root_block_device {
    volume_size = var.root_volume_size
  }

}


resource "aws_security_group" "ec2" {
  name = format("%s-ec2-sg", var.prefix)
  vpc_id = data.aws_vpc.vpc.id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
