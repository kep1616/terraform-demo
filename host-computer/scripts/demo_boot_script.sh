#Get Terraform
sudo apt-get install unzip
sudo wget https://releases.hashicorp.com/terraform/0.12.10/terraform_0.12.10_linux_amd64.zip

#Install Terraform
sudo unzip terraform_0.12.10_linux_amd64.zip
sudo mv terraform /usr/local/bin/

#Remove downloaded Terraform zip
sudo rm terraform_0.12.10_linux_amd64.zip

#Install Git
sudo apt-get install git-core

#Download Demo Files
git clone https://github.com/kep1616/terraform-demo.git