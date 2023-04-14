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

module "monter_common_python_layer" {
  source = "./module/layer"

  function_prop = {
    function_name = "monter_common_python_layer"
  }

  lambda_prop = {
    architectures : var.lambda_architectures
    runtime : var.lambda_runtime
    runtime_version : var.lambda_runtime_version
  }

  project_prop = {
    project_name : var.project_name
    stage_name : var.stage_name
  }

  layer_file_path = "../api/d_monter_layer/v1_monter_common_python_layer/dist/layer.zip"
}

module "monter_domain_place" {
  source = "./api/domain_place"

  depends_on = [module.monter_common_python_layer]

  env = var.env

  dynamodb_name_pattern = var.dynamodb_name_pattern
  postgres_prop         = {
    endpoint : var.db_endpoint
    port : var.db_port
    schema_name : var.db_name
    user : var.db_user
    password : var.db_password
  }

  api_gateway_v2_prop = {
    id : module.monter_api_gateway_v2.out.api_gateway_id
    arn : module.monter_api_gateway_v2.out.api_gateway_arn
    authorizer_id : module.monter_api_gateway_v2.out.authorizer_id
  }

  iam_prop = {
    aws_iam_role_arn : aws_iam_role.default_iam_for_lambda_role.arn
  }

  domain_name = "place"

  lambda_prop = {
    architectures : var.lambda_architectures
    runtime : var.lambda_runtime
    runtime_version : var.lambda_runtime_version
    memory_size : var.lambda_memory_size
    lambda_timeout_time : var.lambda_timeout_time
  }

  project_prop = {
    project_name : var.project_name
    stage_name : var.stage_name
  }

  monter_common_layer_arn = module.monter_common_python_layer.out.arn

  jwt_secret_key = var.jwt_secret_key
}


module "monter_domain_auth" {
  source = "./api/domain_auth"

  depends_on = [module.monter_common_python_layer]

  env = var.env

  dynamodb_name_pattern = var.dynamodb_name_pattern
  postgres_prop         = {
    endpoint : var.db_endpoint
    port : var.db_port
    schema_name : var.db_name
    user : var.db_user
    password : var.db_password
  }

  api_gateway_v2_prop = {
    id : module.monter_api_gateway_v2.out.api_gateway_id
    arn : module.monter_api_gateway_v2.out.api_gateway_arn
    authorizer_id : module.monter_api_gateway_v2.out.authorizer_id
  }

  iam_prop = {
    aws_iam_role_arn : aws_iam_role.default_iam_for_lambda_role.arn
  }

  domain_name = "auth"

  lambda_prop = {
    architectures : var.lambda_architectures
    runtime : var.lambda_runtime
    runtime_version : var.lambda_runtime_version
    memory_size : var.lambda_memory_size
    lambda_timeout_time : var.lambda_timeout_time
  }

  project_prop = {
    project_name : var.project_name
    stage_name : var.stage_name
  }

  monter_common_layer_arn = module.monter_common_python_layer.out.arn

  jwt_secret_key = var.jwt_secret_key
}