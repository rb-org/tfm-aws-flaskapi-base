output "instance_profile_name" {
  value = "${aws_iam_instance_profile.ec2_role_instance_profile.name}"
}

output "instance_role_name" {
  value = "${aws_iam_role.ec2_role.name}"
}

output "instance_role_id" {
  value = "${aws_iam_role.ec2_role.id}"
}
