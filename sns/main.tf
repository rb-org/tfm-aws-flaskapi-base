module "sns_slack" {
  # source = "git@github.com:exactsoftware/terraform-aws-excp-misc//sns_slack?ref=v0.1.28"
  source = "github.com/rb-org/tfm-aws-excp-misc//sns_slack?ref=v0.0.1"

  sns_slack_webhook     = "${var.sns_slack_webhook}"
  sns_email             = "${var.sns_email}"
  victorops_routing_key = "${var.victorops_routing_key}"
  victorops_webhook     = "${var.victorops_webhook}"
  default_tags          = "${var.default_tags}"

  # create_all            = true
  # create_sns_topic      = true
  # use_source_hash       = false
}
