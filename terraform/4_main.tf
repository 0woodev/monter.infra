module "monter_api_gateway_v2" {
  source = "./gateway/dev"

  env          = var.env
  gateway_prop = {
    api_gateway_name : "monter-api-gateway-v2"
  }

  project_prop = {
    project_name : var.project_name
    stage_name : var.stage_name
  }

  lambda_prop = {
    architectures : var.lambda_architectures
    runtime : var.lambda_runtime
    runtime_version : var.lambda_runtime_version
    memory_size : 128 * 8
    lambda_timeout_time : 60
  }

  postgres_prop = {
    endpoint : var.db_endpoint
    port : var.db_port
  }

  dynamodb_name_pattern = var.dynamodb_name_pattern
}

module "lambda_modularize_test" {
  source = "./module/lambda"

  env = var.env

  dynamodb_name_pattern = var.dynamodb_name_pattern
  postgres_prop         = {
    endpoint : var.db_endpoint
    port : var.db_port
  }

  iam_prop = {
    aws_iam_role_arn: aws_iam_role.default_iam_for_lambda_role.arn
  }

  function_prop = {
    function_name = "v0_test_get"
    handler = "v0_test_get.lambda_handler"
  }

  lambda_prop = {
    architectures : var.lambda_architectures
    runtime : var.lambda_runtime
    runtime_version : var.lambda_runtime_version
    memory_size : var.lambda_memory_size
    lambda_timeout_time : var.lambda_timeout_time
  }

  source_file_path = "v0_test_get/dist/build.zip"
  layer_file_path = "v0_test_get/dist/layer.zip"

  project_prop = {
    project_name : var.project_name
    stage_name : var.stage_name
  }
}

