provider "aws" {
  access_key = ""
  secret_key = ""
  region     = ""
}


data "aws_ssm_parameter" "ami" {
  name = ""

}

resource "aws_vpc" "vpc" {
  cidr_block           = ""
  enable_dns_hostnames = ""

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

}

resource "aws_subnet" "subnet1" {

  cidr_block              = ""
  vpc_id                  = aws_vpc.vpc.id
  map_public_ip_on_launch = ""

}

resource "aws_route_table" "rtb" {

  vpc_id = aws_vpc.vpc.id

  route = {
    cidr_block = ""
  }

}