#!/bin/bash

#Switch to user Participants will use
sudo su -l ec2-user

#Update host
sudo yum update -y

#Get Terraform
sudo yum install unzip -y
wget https://releases.hashicorp.com/terraform/0.12.10/terraform_0.12.10_linux_amd64.zip

#Install Terraform
unzip terraform_0.12.10_linux_amd64.zip
sudo mv terraform /usr/local/bin/

#Remove downloaded Terraform zip
rm terraform_0.12.10_linux_amd64.zip

#Install Git
sudo yum install git-core -y

#Download Demo Files
git clone https://github.com/kep1616/terraform-demo.git /home/ec2-user/terraform-demo

#Setup Demo Files
mv /home/ec2-user/terraform-demo/demo-computer/* /home/ec2-user/
rm -rf /home/ec2-user/terraform-demo