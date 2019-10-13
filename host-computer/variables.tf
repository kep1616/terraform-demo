variable "participants" {
	description = "The number of people who want to participate in the demo."
}

variable "launch_script" {
	description = "The bash script to be run at launch by the ec2 instance."
    default = file("${path.module}/scripts/demo_boot_script.sh")
}

variable "ec2_ami" {
    description = "The ami to use on the demo ec2 instances. The default is Ubuntu."
    default = "ami-04b9e92b5572fa0d1"
}

variable "region" {
    description = "The region to build the infrastructure in."
    default = "us-east-1"
}

variable "instance_size" {
    description = "The size of the ec2 instance to create."
    default = "t2.micro"
}

variable "demo_role_policy" {
    description = "The policy used by the demo ec2 unit role."
    default = file("${path.module}/roles/ec2_demo_role.json")
}