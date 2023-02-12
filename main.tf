provider "aws" {
  profile = "default"
  region  = var.aws_region
}
data "aws_ssm_parameter" "ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = "true"

}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}
resource "aws_subnet" "subnet1" {
  cidr_block              = var.vpc_subnet1_cidr_block
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = var.map_public_ip_on_launch
}
resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}
resource "aws_route_table_association" "rta-subnet1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.rtb.id

}
resource "aws_security_group" "nginx-sg" {
  name   = "nginx_sg"
  vpc_id = aws_vpc.vpc.id
  ingress {
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
resource "aws_instance" "nginx1" {
  ami                    = data.aws_ssm_parameter.ami.value
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.nginx-sg.id]

  user_data = <<EOF
    #! /bin/bash
    sudo amazon-linux-extras install -y nginx1
    sudo service nginx start
    sudo rm /usr/share/nginx/html/index.html
    echo '<html><head><title>Madhu Boyina server</title></head><body style=\"backgroun-color:1F778D\"><h1>Hello Boyinas<h1></body></html>
    EOF
}

