/*
if you dont have count argument then you can use this below code directly 
but if you have count then you need to make some changes 

*/

# output "ec2_public_ip" {
#   value = aws_instance.my_instance.public_ip
# }


# output "ec2_public_dns" {
#   value = aws_instance.my_instance.public_dns
# }


# output "ec2_private_ip" {
#   value = aws_instance.my_instance.private_ip
# }



## CHANGED ONE  : * is used to tell i have multiple resources so get for all 

# used values func here to get the values from a collection of resources bcoz in the main code :
  # - you used for each or count while creating the ec2 instances in ec2.tf 

output "ec2_public_dns" {
    value = values(aws_instance.my_instance)[*].public_dns
}


output "ec2_public_ip" {
    value = values(aws_instance.my_instance)[*].public_ip
}

output "ec2_private_ip" {
    value = values(aws_instance.my_instance)[*].private_ip
}