terraform {
  backend "s3" {
    bucket = "amiteshranjanpathak"
    key = "prod/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-lock"
    encrypt = true
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "my_ec2" {
  count         = 4
  ami           = "ami-0a4408457f9a03be3" # Amazon Linux 2 - Mumbai
  instance_type = "t2.micro"

  tags = {
    Name = "jenkins-ec2-${count.index + 1}"
  }
}