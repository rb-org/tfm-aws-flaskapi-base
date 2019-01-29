data "aws_iam_policy_document" "ec2_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ec2_role" {
  name               = "${local.ec2_role_name}"
  path               = "/"
  assume_role_policy = "${data.aws_iam_policy_document.ec2_assume_role_policy.json}"
}

resource "aws_iam_instance_profile" "ec2_role_instance_profile" {
  name = "${local.ec2_role_name}-profile"
  role = "${aws_iam_role.ec2_role.name}"
}

resource "aws_iam_role_policy_attachment" "ec2_role_policy_attachment" {
  count      = "${length(compact(var.managed_policy_arns))}"
  role       = "${aws_iam_role.ec2_role.name}"
  policy_arn = "${var.managed_policy_arns[count.index]}"
}

variable "managed_policy_arns" {
  type = "list"

  default = [
    "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM",
    "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
    "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess",
    "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",
    "arn:aws:iam::aws:policy/AmazonSSMFullAccess",
  ]
}
