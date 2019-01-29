// Security Group Resource for Instances
resource "aws_security_group" "main" {
  name        = "${local.name_prefix}-${var.app_id}-sg"
  description = "${var.sg_description}"
  vpc_id      = "${var.vpc_id}"

  tags = "${merge(
    var.tags, 
    map(
      "Name" , "${local.name_prefix}-${var.app_id}-sg",
      "AppID", "${var.app_id}"
      ))}"
}

// Egress rule for Instances
resource "aws_security_group_rule" "er" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.main.id}"
  description       = "Egress rule from ${upper(var.app_id)} to all"
}
