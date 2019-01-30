resource "aws_security_group" "sg_tux" {
  name        = "${local.sg_tux_name}"
  description = "Applied to all Linux instances"
  vpc_id      = "${var.vpc_id}"

  tags = "${merge(var.default_tags, map(
      "Name", "${local.sg_tux_name}"
    ))}"
}

##########
# Ingress
##########

resource "aws_security_group_rule" "ir_base_tux_ssh_t" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = "${var.sg_ssh_id}"
  description              = "Allow SSH from bastion"
  security_group_id        = "${aws_security_group.sg_tux.id}"
}

#########
# Egress
#########
resource "aws_security_group_rule" "er_base_tux" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.sg_tux.id}"
}
