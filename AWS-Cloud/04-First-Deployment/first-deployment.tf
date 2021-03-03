# Configure a Cloud Provider
provider "aws" {
  region = "us-east-2"
}


resource "aws_instance" "web" {
   count = 2 
   ami   = "ami-09246ddb00c7c4fef"
   instance_type = "t2.micro"

   tags = {
    Name = "HelloWorld"
   }
}
