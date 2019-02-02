output "tux_sg_id" {
  value = "${aws_security_group.sg_tux.id}"
}

output "db_clients_sg_id" {
  value = "${aws_security_group.sg_db_clients.id}"
}

output "r53_hcs_sg_id" {
  value = "${aws_security_group.sg_r53_health_checks.id}"
}

output "alb_sg_id" {
  value = "${aws_security_group.sg_alb.id}"
}

output "flaskapi_sg_id" {
  value = "${aws_security_group.sg_flaskapi.id}"
}
