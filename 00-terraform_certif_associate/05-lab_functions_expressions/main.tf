provider "aws" {
    region = var.main_region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"
  name = "my_vpc"
  azs = ["us-east-1a"]
  cidr = "10.10.0.0/16"
  private_subnets = ["10.10.1.0/24"]
  public_subnets = ["10.10.101.0/24"]
}

data "aws_ssm_parameter" "ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_security_group" "main_sg" {
    name = "main_sg_policy"
    vpc_id = module.vpc.vpc_id
    dynamic "ingress" {
      for_each = var.rules 
        content {
          from_port = ingress.value["port"]
          to_port = ingress.value["port"]
          protocol = ingress.value["prot"]
          cidr_blocks = ingress.value["cidr_blocks"]

      }
      
    }
    egress = [ {
      cidr_blocks = [ "0.0.0.0/0" ]      
      from_port = 0
      protocol = "-1"
      to_port = 0
      description = "internet access"      
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self = false
    } ]

    
    
    
    
    tags = {
      "name" = "main_sg_policy"
    }
}

resource "aws_instance" "my_vm" {
    ami = data.aws_ssm_parameter.ami.value
    subnet_id = module.vpc.public_subnets[0]
    instance_type = "t3.micro"
    security_groups = [aws_security_group.main_sg.id]
    associate_public_ip_address = true
    user_data = fileexists("script.sh") ? file("script.sh") : null
    tags = {
      "name" = "my_vm"
    }

}