terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
    # in case you run yr terrafom cmd insice an ec2 I think no need to specify the below `access_key` and `secret_key`
    access_key = "AKIAYRFSKPAGI3RHLK6Q" 
    secret_key = "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"
}

resource "aws_vpc" "my_vpc" {
    cidr_block = "10.10.0.0/16"
}

resource "aws_subnet" "my_subnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.10.1.0/24"
  availability_zone = "us-east-1a"    # us-east-1a, us-east-1b, us-east-1c, us-east-1d, us-east-1e, us-east-1f 
}

resource "aws_instance" "my_vm" {
    ami = "ami-06d3b5e1ed9e1d982"
    subnet_id = aws_subnet.my_subnet.id
    instance_type = "t2.micro"
    tags = {
      "name" = "my-tf-vm"
    }
    
}