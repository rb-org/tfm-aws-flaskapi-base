##########
# Ingress
##########

# SSH Jumphost
module "sg_ssh" {
  source = "./module"

  vpc_id         = "${var.vpc_id}"
  app_id         = "ssh}"
  sg_description = "SG for SSH Bastion"
  tags           = "${var.default_tags}"
}

resource "aws_security_group_rule" "ir_base_ssh_t" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["${var.allowed_ips}"]
  security_group_id = "${module.sg_ssh.id}"
}
