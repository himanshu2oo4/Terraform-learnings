Terraform bascially combines all the tf files into a single configuration 

files : 
main.tf
network.tf
security.tf
ec2.tf

-> all behave almost one logical configuration file 


# you can use terraform refresh to refresh the states of your resources 

- terraform state list : command will list all the resources created by your terraform script  
- terraform state show itemName : get you the info related to that item 


- terraform state rm item-name : remove the link of that item state maintenance between terraform and aws 


- to import the item back to terraform from aws : 
    command : terraform import aws_key_pair.keyForEc2 real-name-of-item-in-aws 
            syntax : terraform import itemName itemIdFromAWS


# if you want to include the already existing resource into terraform 

- first create an object in your terraform file 
resource "aws_instance" "existing_instance"{
   ami = "unknown"
   instance_type = "unknown" 
}

- after this command : terraform import aws_instance.existing_instance instanceID 
- this will take your already existing instance under terraform managed resources 


