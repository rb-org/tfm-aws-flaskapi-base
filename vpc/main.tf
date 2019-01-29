module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "1.53.0"

  name = "${local.vpc_name}"
  cidr = "${var.vpc_cidr}"

  azs                 = "${slice(data.aws_availability_zones.available.names,0,var.az_count)}"
  public_subnets      = ["${local.public_subnets}"]
  private_subnets     = ["${local.private_subnets}"]
  database_subnets    = ["${local.database_subnets}"]
  external_nat_ip_ids = ["${aws_eip.nat.*.id}"]

  enable_nat_gateway   = true
  enable_vpn_gateway   = false
  enable_dns_hostnames = true
  enable_dns_support   = true
  enable_s3_endpoint   = true

  private_subnet_suffix  = "prv"
  public_subnet_suffix   = "pub"
  database_subnet_suffix = "dbs"

  # DHCP Options
  enable_dhcp_options              = true
  dhcp_options_domain_name         = "${data.aws_region.current.name}.compute.internal"
  dhcp_options_domain_name_servers = ["AmazonProvidedDNS"]

  dhcp_options_tags = {
    Name = "${local.name_prefix}-dhcp"
  }

  # Tags

  tags = "${merge(
    var.default_tags, 
    map(
      "Environment", format("%s", terraform.workspace)
      )
    )
  }"
}

resource "aws_eip" "nat" {
  count = "${var.az_count}"
  vpc   = true
}
