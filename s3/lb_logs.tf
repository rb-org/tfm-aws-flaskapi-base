resource "aws_s3_bucket" "lb_logs" {
  bucket = "${local.bucket_lb_logs}"
  region = "${var.region}"
  acl    = "bucket-owner-full-control"
  policy = "${data.aws_iam_policy_document.bucket_policy.json}"

  tags = "${merge(
    var.default_tags, 
    map(
      "Name", format("%s", local.bucket_lb_logs),
      "Workspace", format("%s", terraform.workspace)
    )
  )}"

  versioning {
    enabled = false
  }

  lifecycle_rule {
    enabled = true

    expiration {
      days = "${var.expiration_days}"
    }
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
