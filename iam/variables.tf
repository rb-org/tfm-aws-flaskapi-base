variable "principal_type" {
  type        = "string"
  default     = "Service"
  description = "Type of principal"
}

variable "principal_identifiers" {
  type        = "list"
  default     = ["ec2.amazonaws.com"]
  description = "List of principal entities"
}
