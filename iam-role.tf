resource "aws_iam_role" "eb_ec2_instance_profile" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
  version = "2008-10-17"
}

resource "aws_iam_policy_attachment" "attach_policies" {
  for_each = toset(var.require_ssm_policies)

  name       = "attachment-${each.value}"
  roles      = [aws_iam_role.eb_ec2_instance_profile.name]
  policy_arn = each.value
}
