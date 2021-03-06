module "vpc" {
  source = "./vpc"

  default_tags = "${var.default_tags}"
}

module "iam" {
  source = "./iam"
}

module "s3" {
  source = "./s3"

  region       = "${data.aws_region.current.name}"
  default_tags = "${var.default_tags}"
}

module "sgs" {
  source = "./sgs"

  vpc_id                  = "${module.vpc.vpc_id}"
  default_tags            = "${var.default_tags}"
  sg_ssh_id               = "${module.ec2_ssh.sg_id}"
  r53_health_check_ranges = "${data.aws_ip_ranges.route_53_health_checks.cidr_blocks}"
}

module "sns" {
  source = "./sns"

  default_tags = "${var.default_tags}"
}

module "acm" {
  source = "./acm"

  default_tags       = "${var.default_tags}"
  r53_dns_domain_pub = "${var.r53_dns_domain_pub}"
}

module "ec2_ssh" {
  source = "./ec2_ssh"

  # Network
  vpc_id          = "${module.vpc.vpc_id}"
  private_subnets = "${module.vpc.private_subnets_ids}"
  public_subnets  = "${module.vpc.public_subnets_ids}"

  # Instance
  instance_type         = "${var.instance_type}"
  instance_count        = "${var.instance_count}"
  instance_profile_name = "${module.iam.instance_profile_name}"
  ami_id                = "${data.aws_ami.ubuntu_linux.image_id}"
  key_name              = "${var.key_name}"
  disable_api_term      = "${var.disable_api_term}"
  ebs_optimized         = "${var.ebs_optimized}"

  # Security Groups
  db_clients_sg_id = "${module.sgs.db_clients_sg_id}"

  # Tags
  default_tags   = "${var.default_tags}"
  enable_backups = "${var.enable_backups}"
  enable_chef    = "${var.enable_chef}"

  # Monitoring 
  enable_cw_metrics        = "${var.enable_cw_metrics}"
  enable_monitoring        = "${var.enable_monitoring}"
  enable_cw_alarm_cpu      = "${var.enable_cw_alarm_cpu}"
  enable_cw_alarm_disk_tux = "${var.enable_cw_alarm_disk_tux}"
  log_group_retention      = "${var.log_group_retention}"
}
