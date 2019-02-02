data "aws_route53_zone" "public" {
  # zone_id = "${var.zone_id_pub[0]}"
  name = "${var.r53_dns_domain_pub}."
}
