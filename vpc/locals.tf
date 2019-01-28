locals {
  name_prefix          = "${terraform.workspace}"
  vpc_name             = "${local.name_prefix}"
  enable_vpc_flow_logs = "${var.enable_vpc_flow_logs ? 1 : 0}"

  private_subnets = ["${
    slice(list(
      cidrsubnet(var.vpc_cidr, 8, 101),
      cidrsubnet(var.vpc_cidr, 8, 102),
      cidrsubnet(var.vpc_cidr, 8, 103),
    ), 0, (var.az_count))
  }"]

  public_subnets = ["${
    slice(list(
      cidrsubnet(var.vpc_cidr, 8, 1),
      cidrsubnet(var.vpc_cidr, 8, 2),
      cidrsubnet(var.vpc_cidr, 8, 3),
    ), 0, (var.az_count))
  }"]

  database_subnets = ["${
    slice(list(
      cidrsubnet(var.vpc_cidr, 8, 201),
      cidrsubnet(var.vpc_cidr, 8, 202),
      cidrsubnet(var.vpc_cidr, 8, 203),
    ), 0, (var.az_count))
  }"]
}
