variable "zmregion" {
  type    = string
  default = "us-east-1"
}

provider "aws" {
  region = var.zmregion
}


module "vpc" {
  source = "./modules/vpc"
  region = var.zmregion

}


resource "aws_instance" "my_vm" {

  ami           = "module.vpc.my_ami_id"
  subnet_id     = "module.vpc.submet_id"
  instance_type = "t3.micro"
  tags = {
    "name" = "zmvm"
  }
}