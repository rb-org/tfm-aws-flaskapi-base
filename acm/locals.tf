locals {
  domain_name = "${replace(data.aws_route53_zone.public.name, "/[.]$/", "")}"

  # test        = "${var.zone_id_pub == "" ? 0: length(var.zone_id_pub)}"
  # local_count = "${var.create_certs ? 1 : 0}"
}

# Replace above with https://github.com/terraform-providers/terraform-provider-aws/pull/6844 once we upgrade beyond AWS 1.52.0

