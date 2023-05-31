resource "aws_s3_object" "s3_for_layer" {
  count = fileexists(var.layer_file_path) ? 1 : 0

  bucket = "monter-product-build"
  key    = "build/${var.project_prop.project_name}/${var.function_prop.function_name}/layer"
  source = var.layer_file_path

  source_hash = filemd5(var.layer_file_path)
}

resource "aws_lambda_layer_version" "monter_lambda_layer" {
  count = fileexists(var.layer_file_path) ? 1 : 0

  layer_name = "${var.project_prop.project_name}_${var.function_prop.function_name}_layer"

  s3_bucket         = aws_s3_object.s3_for_layer[0].bucket
  s3_key            = aws_s3_object.s3_for_layer[0].key
  s3_object_version = aws_s3_object.s3_for_layer[0].version_id

  compatible_architectures = [var.lambda_prop.architectures]
  compatible_runtimes      = [
    "${var.lambda_prop.runtime}${var.lambda_prop.runtime_version}" # for python
  ]

  source_code_hash = filebase64sha256(var.layer_file_path)
}

resource "aws_s3_object" "s3_for_lambda" {
  bucket = "monter-product-build"
  key    = "build/${var.project_prop.project_name}/${var.function_prop.function_name}/build"
  source = var.source_file_path

  source_hash = filemd5(var.source_file_path)
}

resource "aws_lambda_function" "monter_lambda" {
  function_name = "${var.project_prop.project_name}_${var.function_prop.function_name}"
  role          = var.iam_prop.aws_iam_role_arn

  s3_bucket         = aws_s3_object.s3_for_lambda.bucket
  s3_key            = aws_s3_object.s3_for_lambda.key
  s3_object_version = aws_s3_object.s3_for_lambda.version_id

  handler = var.function_prop.handler

  runtime       = "${var.lambda_prop.runtime}${var.lambda_prop.runtime_version}"
  architectures = [var.lambda_prop.architectures]
  memory_size   = var.lambda_prop.memory_size
  timeout       = var.lambda_prop.lambda_timeout_time

  tags = {
    Name = "${var.project_prop.project_name}_${var.function_prop.function_name}"
  }


  #  layers = concat([for s in aws_lambda_layer_version.monter_lambda_layer :s.arn], formatlist(var.monter_common_layer_arn))
  layers = var.monter_common_layer_arn != null ? concat([
    for s in aws_lambda_layer_version.monter_lambda_layer :s.arn
  ], formatlist(var.monter_common_layer_arn)) : [for s in aws_lambda_layer_version.monter_lambda_layer :s.arn]

  environment {
    variables = {
      project_name = var.project_prop.project_name
      stage_name   = var.project_prop.stage_name

      postgres_endpoint    = var.postgres_prop.endpoint
      postgres_port        = var.postgres_prop.port
      postgres_db_name     = var.postgres_prop.schema_name
      postgres_db_user     = var.postgres_prop.user
      postgres_db_password = var.postgres_prop.password

      dynamodb_name_pattern = var.dynamodb_name_pattern

      jwt_secret_key = var.jwt_secret_key

      from = var.twilio_prop.from
      account_sid = var.twilio_prop.account_sid
      auth_token = var.twilio_prop.auth_token
    }
  }

  source_code_hash = filebase64sha256(var.source_file_path)
}

resource "aws_cloudwatch_log_group" "monter_lambda_cloudwatch" {
  name              = "/aws/lambda/${aws_lambda_function.monter_lambda.function_name}"
  retention_in_days = 1
}