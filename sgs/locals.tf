locals {
  name_prefix              = "${terraform.workspace}"
  sg_alb_name              = "${local.name_prefix}-alb-sg"
  sg_flaskapi_name         = "${local.name_prefix}-flaskapi-sg"
  sg_tux_name              = "${local.name_prefix}-tux-sg"
  sg_db_clients_name       = "${local.name_prefix}-db-clients-sg"
  sg_r53_health_check_name = "${local.name_prefix}-r53-health-check-sg"
}
