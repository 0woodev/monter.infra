variable "iam_prop" {
  description = "Value of accountId"
  type        = map(string)
  default = {
    aws_iam_role_arn : "not-assigned"
  }
}
