provider "aws" {
    region= "ap-south-1"
}

resource "aws_instance" "example" {
    ami = "ami-07a00cf47dbbc844c"
    instance_type = "t3.micro"
    subnet_id = "subnet-032503d95eb36acf9"
    key_name = "aws-connection.pem"
    tags = {
        Name = "my-firstTerraformEc2"
    }
  
}