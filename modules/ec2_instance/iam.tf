resource "aws_iam_policy" "ec2_policy" {
  path        = "/"
  description = "Policy to provide EC2 access to S3"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:Get*",
          "s3:Put*",
          "s3:List*"
        ]
        Effect   = "Allow"
        Resource = format("arn:aws:s3:::%s/*", var.s3_bucket_name)
      }
    ]
  })
}

resource "aws_iam_role" "ec2_role" {
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2-profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_iam_policy_attachment" "ec2_policy_role" {
  name       = "ec2-policy-attachment"
  roles      = [aws_iam_role.ec2_role.name]
  policy_arn = aws_iam_policy.ec2_policy.arn
}