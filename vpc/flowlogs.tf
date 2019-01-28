resource "aws_cloudwatch_log_group" "vpc_flow_logs" {
  count             = "${local.enable_vpc_flow_logs}"
  name              = "/excp/${local.vpc_name}-vpc-flow-logs"
  retention_in_days = "${var.flow_log_retention_in_days}"
}

data "aws_iam_policy_document" "assume_role" {
  count = "${local.enable_vpc_flow_logs}"

  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals = {
      identifiers = [
        "vpc-flow-logs.amazonaws.com",
      ]

      type = "Service"
    }
  }
}

resource "aws_iam_role" "vpc_flow_logs" {
  count              = "${local.enable_vpc_flow_logs}"
  name               = "${local.vpc_name}-vpc-flow-logs-role"
  assume_role_policy = "${data.aws_iam_policy_document.assume_role.json}"
  path               = "/"
}

data "aws_iam_policy_document" "vpc_flow_logs_cloudwatch" {
  count = "${local.enable_vpc_flow_logs}"

  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
    ]

    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "write_flow_logs_cloudwatch_policy" {
  count  = "${local.enable_vpc_flow_logs}"
  name   = "${local.vpc_name}-vpc-flow-logs-policy"
  policy = "${data.aws_iam_policy_document.vpc_flow_logs_cloudwatch.json}"
  role   = "${aws_iam_role.vpc_flow_logs.id}"
}

resource "aws_flow_log" "this" {
  count          = "${local.enable_vpc_flow_logs}"
  iam_role_arn   = "${aws_iam_role.vpc_flow_logs.arn}"
  log_group_name = "${aws_cloudwatch_log_group.vpc_flow_logs.name}"
  traffic_type   = "ALL"
  vpc_id         = "${module.vpc.vpc_id}"
}
