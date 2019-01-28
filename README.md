# Terraform - AWS - FlaskApi - Base

## Build Status

| Branch | Status |
|:---:|:---:|
| master | [![CircleCI](https://circleci.com/gh/rb-org/tfm-aws-flaskapi-base/tree/master.svg?style=svg&circle-token=ae243ef5df0c7114d817724a928e4fb1b2899c4f)](https://circleci.com/gh/rb-org/tfm-aws-flaskapi-base/tree/master)  |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| account\_id | AWS Account ID | string | `""` | yes |
| default\_tags | Map of default tags applied to all resources | map | `<map>` | yes |
| region | AWS Region | string | `"eu-west-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| database\_subnet\_group |  |
| database\_subnets\_ids |  |
| nat\_public\_ips |  |
| private\_subnets\_cidr\_blocks |  |
| private\_subnets\_ids |  |
| public\_subnets\_cidr\_blocks |  |
| public\_subnets\_ids |  |
| vpc\_id |  |