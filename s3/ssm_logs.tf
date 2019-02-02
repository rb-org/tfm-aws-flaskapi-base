resource "aws_s3_bucket" "ssm_patch_logs" {
  bucket = "${local.bucket_ssm_patch_logs}"
  region = "${var.region}"
  acl    = "private"

  lifecycle_rule {
    id      = "expire-to-void"
    enabled = true

    expiration {
      days = "${var.expiration_days}" # You cannot have 0 expiration days, even if the lifecycle rule is not enabled
    }
  }

  tags = "${merge(var.default_tags, 
    map(
      "Environment", format("%s", terraform.workspace),
      "S3-Lifecycle-Expiration-Days", "${var.expiration_days}"
      )
    )
  }"
}

resource "aws_s3_bucket" "ssm_doc_logs" {
  bucket = "${local.bucket_ssm_doc_logs}"
  region = "${var.region}"
  acl    = "private"

  lifecycle_rule {
    id      = "expire-to-void"
    enabled = true

    expiration {
      days = "${var.expiration_days}" # You cannot have 0 expiration days, even if the lifecycle rule is not enabled
    }
  }

  tags = "${merge(
    var.default_tags, 
    map(
      "Environment", format("%s", terraform.workspace),
      "S3-Lifecycle-Expiration-Days", "${var.expiration_days}"
      )
  )}"
}
