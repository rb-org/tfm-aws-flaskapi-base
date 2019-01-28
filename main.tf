module "vpc" {
  source = "./vpc"

  default_tags = "${var.default_tags}"
}
