locals {
  name_prefix = "${terraform.workspace}"
  name_suffix = "${data.aws_caller_identity.current.account_id}"

  bucket_ssm_patch_logs = "${local.name_prefix}-ssm-patch-logs-${local.name_suffix}"
  bucket_ssm_doc_logs   = "${local.name_prefix}-ssm-doc-logs-${local.name_suffix}"

  bucket_lb_logs = "${local.name_prefix}-lb-logs-${local.name_suffix}"
}
