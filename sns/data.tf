# Data Resources

# SSM Parameters

data "aws_ssm_parameter" "slack_webhook" {
  name = "/x200/slack_webhook"
}

data "aws_ssm_parameter" "sns_email" {
  name = "/x200/sns_email"
}

data "aws_ssm_parameter" "victorops_routing_key" {
  name = "/x200/victorops_routing_key"
}

data "aws_ssm_parameter" "victorops_webhook" {
  name = "/x200/victorops_webhook"
}
