locals {
  name_prefix        = "${terraform.workspace}"
  sg_tux_name        = "${local.name_prefix}-tux-sg"
  sg_db_clients_name = "${local.name_prefix}-db-clients-sg"
}
