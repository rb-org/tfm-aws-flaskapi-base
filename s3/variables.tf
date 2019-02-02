variable "region" {
  description = "The AWS region to launch"
}

variable "default_tags" {
  description = "Map of tags to add to all resources"
  type        = "map"
}

variable "infrequent_transition_days" {
  description = "Days before moving data to Standard-IA. Must be at least 30. 0 is disabled."
  default     = 0
}

variable "glacier_transition_days" {
  description = "Days before moving data to Glacier. Must be at least 180. 0 is disabled."
  default     = 0
}

variable "expiration_days" {
  description = "Days before purging data. 0 is disabled."
  default     = 10
}
