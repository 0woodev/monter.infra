output "out" {
  value = {
    function_name = aws_lambda_function.monter_lambda.function_name,
    arn           = aws_lambda_function.monter_lambda.arn,
    invoke_arn    = aws_lambda_function.monter_lambda.invoke_arn,
  }
}
