# variable "aws_access_key" {
#   type      = string
#   sensitive = true
# }

# variable "aws_secret_key" {
#   type      = string
#   sensitive = true
# }

variable "naming_prefix" {
  type    = string
  default = "boyinas"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"

}

variable "enable_dns_hostnames" {
  type    = bool
  default = true

}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"

}

variable "vpc_subnet_count" {
  type    = number
  default = 2

}

variable "vpc_subnets_cidr_block" {
  type    = list(string)
  default = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "map_public_ip_on_launch" {
  type    = bool
  default = true

}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "instance_count" {
  type    = number
  default = 2
}


variable "company" {
  type    = string
  default = "Boyinas"
}

variable "project" {
  type = string
}

variable "billing_code" {
  type = string
}       