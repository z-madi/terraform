provider "aws" {
  region = var.region

}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.1.0.0/16"
}

resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.1.1.0/24"
}

# using ssm aws public endpoint to get the last AMI ID for aws image linux 2 machine

data "aws_ssm_parameter" "this" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}