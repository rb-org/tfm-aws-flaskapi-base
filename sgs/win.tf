resource "aws_security_group" "sg_win" {
  name        = "${local.sg_win_name}"
  description = "Applied to all Windows instances to provide RDP access"
  vpc_id      = "${var.vpc_id}"

  tags = "${merge(var.default_tags, map(
      "Name", "${local.sg_win_name}"
    ))}"
}

##########
# Ingress
##########

#########
# Egress
#########
resource "aws_security_group_rule" "er_base_win" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.sg_win.id}"
}
