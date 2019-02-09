# Outputs

output "ok_slack_topic_arn" {
  value = "${module.sns_slack.ok_slack_topic_arn}"
}

output "urgent_slack_topic_arn" {
  value = "${module.sns_slack.urgent_slack_topic_arn}"
}

output "emergency_slack_topic_arn" {
  value = "${module.sns_slack.emergency_slack_topic_arn}"
}

output "default_slack_topic_arn" {
  value = "${module.sns_slack.default_slack_topic_arn}"
}

output "ok_slack_topic_cw_arn" {
  value = "${module.sns_slack.ok_slack_topic_cw_arn}"
}

output "urgent_slack_topic_cw_arn" {
  value = "${module.sns_slack.urgent_slack_topic_cw_arn}"
}

output "emergency_slack_topic_cw_arn" {
  value = "${module.sns_slack.emergency_slack_topic_cw_arn}"
}

output "default_slack_topic_cw_arn" {
  value = "${module.sns_slack.default_slack_topic_cw_arn}"
}
