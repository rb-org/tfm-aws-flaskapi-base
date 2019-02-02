## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| default_tags | Map of tags to add to all resources | map | - | yes |
| expiration_days | Days before purging data. 0 is disabled. | string | - | yes |
| glacier_transition_days | Days before moving data to Glacier. Must be at least 180. 0 is disabled. | string | - | yes |
| infrequent_transition_days | Days before moving data to Standard-IA. Must be at least 30. 0 is disabled. | string | - | yes |
| region | The AWS region to launch | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| bucket_arn | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname |
| bucket_id | The name of the bucket |
| s3_lb_logs_arn | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname |
| s3_lb_logs_id | The name of the bucket |
| shared_bucket_arn | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname |
| shared_bucket_id | The name of the bucket |
| ssm_bucket_arn | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname |
| ssm_bucket_id | The name of the bucket |
