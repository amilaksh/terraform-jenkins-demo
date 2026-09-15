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

resource "aws_instance" "demo" {
  ami = "ami-0f58b397bc5c1f2e8"
  instance_type = "t2.micro"
  tags = { Name = "amitesh-jenkins-test" }
}
