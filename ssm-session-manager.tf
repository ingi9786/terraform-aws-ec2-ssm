resource "aws_cloudwatch_log_group" "ssm_log_group" {
  name              = var.cloudwatch_log_group
  retention_in_days = var.retention_in_days
  tags              = var.tags
}

resource "aws_ssm_document" "session_manager_config" {
  name          = "SSM-SessionManagerRunShell"
  document_type = "Session"
  content       = jsonencode({
    schemaVersion = "1.0",
    description   = "Document to hold regional settings for Session Manager",
    inputs = {
      cloudWatchLogGroupName      = aws_cloudwatch_log_group.ssm_log_group.name
      cloudWatchEncryptionEnabled = false
  
      # For preventing unnecessary changes 
      cloudWatchStreamingEnabled  = true
      idleSessionTimeout          = "20"
      kmsKeyId                    = ""
      maxSessionDuration          = ""
      runAsDefaultUser            = ""
      runAsEnabled                = false
      s3BucketName                = ""
      s3EncryptionEnabled         = true
      s3KeyPrefix                 = ""
      shellProfile                = {
        linux   = ""
        windows = ""
      }
    },
    sessionType = "Standard_Stream"
  })
}
