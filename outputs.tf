output "iam_role_arn" {
  description = "ARN of the IAM role"
  value       = aws_iam_role.eb_ec2_instance_profile.arn
}

output "cloudwatch_log_group_name" {
  description = "Name of the CloudWatch log group"
  value       = aws_cloudwatch_log_group.ssm_log_group.name
}
