output "out" {
  value = {
    arn = aws_lambda_layer_version.monter_common_layer[0].arn
  }
}
