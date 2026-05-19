#!/bin/bash 


# this file will be used to install nginx on my ec2 | i'll pass this as a user-script of the EC2  
sudo apt-get update 
sudo apt-get install nginx -y  
sudo systemctl start nginx 
sudo systemctl enable nginx 

echo "<h1>automated installing nginx in ec2 using Terraform !! </h1>" > /var/www/html/index.html
