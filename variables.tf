variable "region" {
  description = "AWS Region to deploy resources"
  type        = string
}

variable "role_name" {
  description = "Name of the IAM role"
  type        = string
}

variable "require_ssm_policies" {
  description = "List of IAM policies for SSM to attach to the role"
  type        = list(string)
}

variable "cloudwatch_log_group" {
  description = "The name of the CloudWatch log group"
  type        = string
}

variable "retention_in_days" {
  description = "Retention period for CloudWatch log group"
  type        = number
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}
