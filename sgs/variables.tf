variable "vpc_id" {}

variable "default_tags" {
  type = "map"
}

variable "sg_ssh_id" {}

variable "r53_health_check_ranges" {
  type = "list"
}
