output "sg_id" {
  value = "${aws_security_group.sg_ssh.id}"
}

output "sg_name" {
  value = "${aws_security_group.sg_ssh.name}"
}
