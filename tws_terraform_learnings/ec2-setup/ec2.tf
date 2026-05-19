# key pair 
# vpc 
# ec2 instance

/*
Interpolation : accessing the properties from diff blocks using  . 

blockName.identifierName.propertyname 

example: accessing the key name from that resource group 

aws_key_pair.keyForEc2.key_name    # going deeper with . 


Inbound rules : ingress 
Outbound rules : egress 


from port : 8000 
to port : 9000   both of  this is used to define a range of ports : this will allow ports from 8000-9000 range


protocol = "-1" means 
→ all protocols
→ all ports
→ to anywhere

if you are using protocol -1 : u can pass to and from port as 0 because they gonna be ignored !! 
*/

resource "aws_key_pair" "keyForEc2" {
    key_name = "ec2-terraform-key"
    public_key = file("terra-key-ec2.pub")    # here file func read the data from the mentioned filename

}

# using the default vpc of aws 
resource "aws_default_vpc" "defaultVPC" {
  
}

# creating the security group 
resource "aws_security_group" "my_sec_group"{
    name = "automate-sg"
    description = "this will add a tf generated SG"
    vpc_id = aws_default_vpc.defaultVPC.id     # getting the id of the default vpc which we used above 
    tags = {
        Name = "automate_sg"
    }


    ingress {
        from_port = 22   # from and to port is used to define a range : if both of them are same means only single port allowed !! 
        to_port = 22 
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]   # this means anywhere 
        description = "Opening ssh from anywhere"
    }

    ingress{
        from_port = 80
        to_port = 80 
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Opening HTTP port"
    }

    ingress{
        from_port = 8000 
        to_port = 8000 
        protocol = "tcp" 
        cidr_blocks = ["0.0.0.0/0"]
        description = "Flask app "
    }

    # allows my ec2 to download everything from internet !!  
    egress{
        from_port = 0 
        to_port = 0 
        protocol ="-1"   # equivalent to all ports allowed 
        cidr_blocks = ["0.0.0.0/0"]
        description = "providing all access"
    }

}


# creating ec2 instance 

resource "aws_instance" "my_instance" {
    key_name = aws_key_pair.keyForEc2.key_name
    security_groups = [aws_security_group.my_sec_group.name]
    instance_type = var.ec2_instance_type
    ami = var.ec2_ami_id

    user_data = file("install_nginx.sh")   # user script which we pass while creating the ec2 instance 
    

    # setting storage for the ec2 
    root_block_device {
      volume_size = var.ec2_root_storage_volume
      volume_type = "gp3"
    }

    tags = {
        Name = "terra-automated-ec2"
    }
}




