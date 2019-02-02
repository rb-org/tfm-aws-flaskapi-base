resource "aws_security_group" "sg_alb" {
  name        = "${local.sg_alb_name}"
  description = "ALB Inbound"
  vpc_id      = "${var.vpc_id}"

  tags = "${merge(var.default_tags, map(
      "Name", "${local.sg_alb_name}"
    ))}"
}

#########
# Egress
#########
resource "aws_security_group_rule" "er_base_alb" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.sg_alb.id}"
}
