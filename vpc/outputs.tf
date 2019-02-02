output "database_subnet_group" {
  value = "${module.vpc.database_subnet_group}"
}

output "database_subnets_ids" {
  value = "${module.vpc.database_subnets}"
}

output "nat_public_ips" {
  value = "${module.vpc.nat_public_ips}"
}

output "private_subnets_ids" {
  value = "${module.vpc.private_subnets}"
}

output "private_subnets_cidr_blocks" {
  value = "${module.vpc.private_subnets_cidr_blocks}"
}

output "public_subnets_ids" {
  value = "${module.vpc.public_subnets}"
}

output "public_subnets_cidr_blocks" {
  value = "${module.vpc.public_subnets_cidr_blocks}"
}

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}
