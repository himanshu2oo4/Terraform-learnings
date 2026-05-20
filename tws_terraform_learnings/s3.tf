provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "my_bucket__1" {
  bucket = "my-first-tf-bucket-2026-18-05" # this bucket name should be unique all around the server. 

  tags = {
    Name        = "My-bucket-h012-1"
    Environment = "dev"
  }
}



