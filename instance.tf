terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.45.0"
    }
  }
}

provider "aws" {
  profile = "249414552731_EC2LimitedAccess"
  region = "eu-west-2"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.0.0"

  name                    = "oleh-kurpiak-lab-05"
  ami                     = "ami-0b9932f4918a00c4f"
  instance_type           = "t2.micro"
  key_name                = "oleh_kurpiak"
  vpc_security_group_ids  = ["sg-01142ec3c87ec19dd"]
  subnet_id               = "subnet-09912e30a4b224bde"
}