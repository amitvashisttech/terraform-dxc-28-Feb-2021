# Configure a Cloud Provider
provider "aws" {
  region = "us-east-1"
  version = ">=3.7,<=3.11"
}

provider "aws" {
  region = "us-west-1"
  version = ">=3.7,<=3.11"
  alias   = "us-west-1"
}




resource "aws_instance" "frontend_east" {
   ami   = "ami-0be2609ba883822ec"
   instance_type = "t2.micro"
   count = 1
   tags = {
    Name = "Frontend-East"
   }
}


resource "aws_instance" "frontend_west" {
   ami   = "ami-03130878b60947df3"
   provider = aws.us-west-1
   instance_type = "t2.micro"
   count = 1
   tags = {
    Name = "Frontend-West"
   }
}
