variable "az_count" {
  default = 2
}

variable "enable_vpc_flow_logs" {
  default = false
}

variable "flow_log_retention_in_days" {
  default = 3
}

variable "default_tags" {
  type = "map"
}

variable "vpc_cidr" {
  default = "10.200.0.0/16"
}
