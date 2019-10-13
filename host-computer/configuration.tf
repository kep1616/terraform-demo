resource "aws_iam_role" "ec2_role" {
  name = "tfdemo_role"
  assume_role_policy = "${file("${path.module}/policies/ec2_demo_assume_role.json")}"
}

resource "aws_iam_policy" "ec2_instance_policy" {
  name        = "test-policy"
  description = "A test policy"

  policy = "${file("${path.module}/policies/ec2_demo_policy.json")}"
}

resource "aws_iam_policy_attachment" "demo_policy_attachment" {
  name       = "tfdemo-attachment"
  roles      = ["${aws_iam_role.ec2_role.name}"]
  policy_arn = "${aws_iam_policy.ec2_instance_policy.arn}"
}

resource "aws_iam_instance_profile" "ec2_instance_role" {
	name = "ec2_tfdemo_profile"
	role = "${aws_iam_role.ec2_role.name}"
}

resource "aws_security_group" "demo_vpc" {
	name = "tfdemo_security_group"
	
	ingress {
		from_port       = 0
		to_port         = 0
		protocol        = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

	egress {
		from_port       = 0
		to_port         = 0
		protocol        = "-1"
		cidr_blocks     = ["0.0.0.0/0"]
	}
}

resource  "aws_instance"  "ec2_demo_units" {
	count = "${var.participants}"

    ami = "${var.ec2_ami}"
    instance_type = "${var.instance_size}"
	vpc_security_group_ids = "${aws_security_group.demo_vpc.id}"
	user_data = "${file("${path.module}/scripts/demo_boot_script.sh")}"
	iam_instance_profile = "${aws_iam_instance_profile.ec2_instance_role.name}"

	tags = {
		Name = "tfdemo_unit_${count.index}"
	}
}