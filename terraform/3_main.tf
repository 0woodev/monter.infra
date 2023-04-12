module "monter_api_gateway_v2" {
  source = "./gateway/dev"

  env          = var.env
  gateway_prop = {
    api_gateway_name : "api-gateway-v2"
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