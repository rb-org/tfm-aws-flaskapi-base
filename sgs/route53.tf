resource "aws_security_group" "sg_r53_health_checks" {
  name        = "${local.sg_r53_health_check_name}"
  description = "Allows Route 53 Health Checkers to check ALB health"
  vpc_id      = "${var.vpc_id}"

  tags = "${merge(var.default_tags, map(
      "Name", "${local.sg_r53_health_check_name}",
      "Workspace", format("%s", terraform.workspace)
    ))}"
}

##########
# Ingress
##########
resource "aws_security_group_rule" "ir_r53_https_t" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["${var.r53_health_check_ranges}"]
  description       = "SSH"
  security_group_id = "${aws_security_group.sg_r53_health_checks.id}"
}

#########
# Egress
#########
resource "aws_security_group_rule" "er_r53_base" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.sg_r53_health_checks.id}"
}
