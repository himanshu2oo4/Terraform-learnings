
resource "aws_s3_bucket" "my_bucket" {
    bucket = "remote-infra-bucket-01"
    tags = {
        Name = "my-bucket"
        environment= "dev"
    }
}


