variable "region" {
  description = "AWS Region"
  default     = "eu-west-1"
}

variable "account_id" {
  description = "AWS Account ID"
  default     = ""
}

variable "default_tags" {
  type        = "map"
  description = "Map of default tags applied to all resources"

  default = {
    Github-Repo = "rb-org/tfm-aws-flaskapi-base"
    Terraform   = "true"
  }
}

variable "r53_dns_domain_pub" {
  default = "xyzexcp.nl"
}

# EC2
variable "instance_type" {
  type = "map"

  default = {
    ssh = "t3.medium"
  }
}

variable "instance_count" {
  type = "map"

  default = {
    ssh = 1
  }
}

variable "key_name" {
  default = "x200-euw"
}

# Monitoring 
variable "enable_cw_metrics" {
  type = "map"

  default = {
    ssh = true
  }
}

variable "enable_monitoring" {
  type = "map"

  default = {
    ssh = true
  }
}

variable "enable_cw_alarm_cpu" {
  description = "If true, the launched EC2 instance will have create cpu alarms"
  type        = "map"

  default = {
    ssh = true
  }
}

variable "enable_cw_alarm_disk_tux" {
  description = "If true, the launched EC2 instance will have create disk alarms"
  type        = "map"

  default = {
    ssh = true
  }
}

variable "log_group_retention" {
  type = "map"

  default = {
    x200 = 3
  }
}

# Instance Vars

variable "disable_api_term" {
  type = "map"

  default = {
    ssh = false
  }
}

variable "enable_backups" {
  type = "map"

  default = {
    ssh = "false"
  }
}

variable "enable_chef" {
  type = "map"

  default = {
    ssh = "false"
  }
}

variable "ebs_optimized" {
  type = "map"

  default = {
    ssh = "false"
  }
}

# # SNS
# variable "sns_slack_webhook" {}


# variable "sns_email" {}


# variable "victorops_routing_key" {}
# variable "victorops_webhook" {}

