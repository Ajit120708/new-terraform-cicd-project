
provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA6GBMAR2PBNGK5BFA"
  secret_key = "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"
}

resource "aws_instance" "web" {
  ami           = "ami-078264b8ba71bc45e"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-cicd-server"
  }
}

resource "aws_vpc" "main" {
  cidr_block       = "172.30.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

resource "aws_ebs_volume" "example" {
  availability_zone = "ap-south-1"
  size              = 40

  tags = {
    Name = "terraform-ebs"
  }
}
