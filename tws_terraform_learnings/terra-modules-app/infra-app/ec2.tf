resource "aws_key_pair" "my_key_pair" {
    key_name = "${var.env}-infra-app-key"
    public_key = file("mykey.pub")
    tags = {
      Environment = var.env
    }
}

resource "aws_default_vpc" "default_vpc" {
  
}

resource "aws_security_group" "mysecurities" {
  
  name = "${var.env}-infra-app-sg"
  # vpc_id = aws_default_vpc.default_vpc.id    # by using string interpolation 
  vpc_id = aws_default_vpc.default_vpc.id 
  tags = {
    Name = "${var.env}-infra-app-sg"
  }
  
  ingress {
    to_port = 22
    from_port = 22 
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "opening ssh port"
  }


  ingress {
    from_port = 80 
    to_port = 80 
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "opening port 80 for inbound traffic"

  }

 # outbound means : server/ec2 want to download something from internet 
  egress {
    from_port = 0 
    to_port = 0  
    protocol = "-1"  # allows everything 
    cidr_blocks = ["0.0.0.0/0"]
    description = "providing all for outbound access"
  }
}

data "aws_subnets" "default" {

  filter {
    name   = "vpc-id"
    values = [aws_default_vpc.default_vpc.id]
  }
}

resource "aws_instance" "my_ec2" {
    count = var.instance_count
    depends_on = [ aws_key_pair.my_key_pair , aws_security_group.mysecurities ]

    key_name = aws_key_pair.my_key_pair.key_name
    vpc_security_group_ids = [aws_security_group.mysecurities.id]
    instance_type = var.instance_type
    ami = var.ami_id 
    subnet_id = data.aws_subnets.default.ids[0]
    root_block_device {
      volume_size = var.env=="prd" ? 20 : 10 
      volume_type = "gp3"

    }

    tags = {
        Name = "${var.env}-infra-app-ec2"
        environment = var.env
    }
}

