provider "aws" {
  region  = "${var.region}"
}

resource "aws_iam_role" "ec2_role" {
  name = "test_role"
  assume_role_policy = var.ec2_role_policy
}

resource "aws_iam_instance_profile" "ec2_instance_role" {
	name = "ec2_demo_profile"
	role = "${aws_iam_role.ec2_role.name}"
}

resource  "aws_instance"  "ec2_demo_units" {
	count = var.participants

    ami = "${var.ec2_ami}"
    instance_type = "${var.instance_size}"
	user_data = "${var.launch_script}"
	iam_instance_profile = "${aws_iam_instance_profile.ec2_instance_role.name}"

	tags = {
		Name = "demo_unit_${count.index}"
	}
}