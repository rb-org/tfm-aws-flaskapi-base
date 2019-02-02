output "ssm_bucket_id" {
  description = "The name of the bucket"
  value       = "${aws_s3_bucket.ssm_patch_logs.id}"
}

output "ssm_bucket_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname"
  value       = "${aws_s3_bucket.ssm_patch_logs.arn}"
}

output "ssm_docs_bucket_id" {
  description = "The name of the ssm docs bucket"
  value       = "${aws_s3_bucket.ssm_doc_logs.id}"
}

output "ssm_docs_bucket_arn" {
  description = "The ARN of the ssm docs bucket. Will be of format arn:aws:s3:::bucketname"
  value       = "${aws_s3_bucket.ssm_doc_logs.arn}"
}

output "s3_lb_logs_id" {
  description = "The name of the bucket"
  value       = "${aws_s3_bucket.lb_logs.id}"
}

output "s3_lb_logs_arn" {
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname"
  value       = "${aws_s3_bucket.lb_logs.arn}"
}
