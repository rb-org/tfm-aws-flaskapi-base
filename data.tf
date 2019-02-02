# Data Resources

data "aws_ip_ranges" "route_53_health_checks" {
  regions  = ["eu-west-1", "us-west-1", "us-east-1"]
  services = ["route53_healthchecks"]
}

data "aws_ami" "ubuntu_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }

  # filter {
  #   name   = "owner-alias"
  #   values = ["canonical"]
  # }

  owners = ["099720109477"]
}

data "aws_region" "current" {}
