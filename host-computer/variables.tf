variable "number_of_instances" {
	description = "The number of EC2 units you want to build."
}

variable "ec2_ami" {
    description = "The ami to use on the demo ec2 instances. The default is Ubuntu."
    default = "ami-0b69ea66ff7391e80"
}

variable "region" {
    description = "The region to build the infrastructure in."
    default = "us-east-1"
}

variable "instance_size" {
    description = "The size of the ec2 instance to create."
    default = "t2.micro"
}
