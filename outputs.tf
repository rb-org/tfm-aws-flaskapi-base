output "database_subnet_group" {
  value = "${module.vpc.database_subnet_group}"
}

output "database_subnets_ids" {
  value = "${module.vpc.database_subnets_ids}"
}

output "nat_public_ips" {
  value = "${module.vpc.nat_public_ips}"
}

output "private_subnets_ids" {
  value = "${module.vpc.private_subnets_ids}"
}

output "private_subnets_cidr_blocks" {
  value = "${module.vpc.private_subnets_cidr_blocks}"
}

output "public_subnets_ids" {
  value = "${module.vpc.public_subnets_ids}"
}

output "public_subnets_cidr_blocks" {
  value = "${module.vpc.public_subnets_cidr_blocks}"
}

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "db_clients_sg_id" {
  value = "${module.sgs.db_clients_sg_id}"
}

# ACM Certs
output "wildcard_cert_arn" {
  value = "${module.acm.wildcard_cert_arn}"
}

# Security Groups
output "r53_hcs_sg_id" {
  value = "${module.sgs.r53_hcs_sg_id}"
}

output "alb_sg_id" {
  value = "${module.sgs.alb_sg_id}"
}

output "ssh_sg_id" {
  value = "${module.ec2_ssh.sg_id}"
}

output "tux_sg_id" {
  value = "${module.sgs.tux_sg_id}"
}

output "flaskapi_sg_id" {
  value = "${module.sgs.flaskapi_sg_id}"
}

# S3
output "s3_lb_logs_id" {
  description = "The name of the bucket"
  value       = "${module.s3.s3_lb_logs_id}"
}

output "ssm_docs_bucket_id" {
  description = "The name of the ssm docs bucket"
  value       = "${module.s3.ssm_docs_bucket_id}"
}

output "ssm_patch_bucket_id" {
  description = "The name of the bucket"
  value       = "${module.s3.ssm_bucket_id}"
}
