provider "aws" {
    alias = "UsEast1"
    region= "us-east-1"
}

provider "aws" {
    alias = "UsEast2"   # setting the alias name for useast2 region 
    region = "us-east-2"
}
        #   resource      name 
resource "aws_instance" "ex-1" {
    ami = "ami-091138d0f0d41ff90"  # ami from us-east 1 region 
    instance_type = "t3.micro"   # this instance type should be available in that region 

    key_name = "ec2-connect"  # no .pem needed 
    
    provider = aws.UsEast1

    tags = {
        Name = "InstanceInEast1"
    }

}


resource "aws_instance" "ex-2" {
    ami = "ami-0fe18bc3cfa53a248"
    instance_type = "t3.micro"
    key_name = "usEast2pair"
    provider = aws.UsEast2
    tags= {
        Name = "instanceIneast2"
    }
}