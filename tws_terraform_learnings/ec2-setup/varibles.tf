# declaring some variables which we can use in the main ec2.tf file 

/*
syntax : 
    variable var-name {
        default = value 
        type = string/number/bool -> type of that particular value 
    }


    you can use these variables directly by specifying the var.variablename 

    REMEMBER : child modules cannot access the variables directly , you have to mention it explicitly 
        source = "./modules/ec2"  
        then downwards write your configuration : you have to use this source line in the block 



*/
variable "ec2_instance_type" {
  default = "t3.micro"
  type    = string
}

variable "ec2_ami_id" {
  default = "ami-07a00cf47dbbc844c"
  type    = string
}

variable "ec2_default_root_storage_volume" {
  default = 8
  type    = number
}


variable "env" {
  default = "dev"
}
