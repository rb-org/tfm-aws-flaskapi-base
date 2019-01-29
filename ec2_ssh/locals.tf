locals {
  name_prefix       = "${terraform.workspace}"
  instance_name     = "${local.name_prefix}-${var.app_id}"
  cw_agent_ssm_path = "/${terraform.workspace}/cw_agent/${local.instance_name}"
  log_group_name    = "/xyz/${local.instance_name}-log-group"
  sg_ssh_name       = "${local.name_prefix}-${var.app_id}-sg"
}
