output "tux_sg_id" {
  value = "${aws_security_group.sg_tux.id}"
}

output "db_clients_sg_id" {
  value = "${aws_security_group.sg_db_clients.id}"
}
