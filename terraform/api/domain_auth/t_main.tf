variable "function_list" {
  default = {
    v1_auth_google_post = {
      route_key        = "GET /auth/google"
      is_authorized    = false
      handler          = "d_auth.v1_auth_google_post.v1_auth_google_post.lambda_handler"
      source_file_path = "../api/d_auth/v1_auth_google_post/dist/build.zip"
      layer_file_path  = "../api/d_auth/v1_auth_google_post/dist/layer.zip"
      runtime          = null  # 해당 람다에 대해서 변경하고 싶다면 null 말고 다른 값을 넣으면 된다
      runtime_version  = null  # 해당 람다에 대해서 변경하고 싶다면 null 말고 다른 값을 넣으면 된다
    }
    v1_auth_google_token_post = {
      route_key        = "POST /auth/google/{token}"
      is_authorized    = false
      handler          = "d_auth.v1_auth_google_token_post.v1_auth_google_token_post.lambda_handler"
      source_file_path = "../api/d_auth/v1_auth_google_token_post/dist/build.zip"
      layer_file_path  = "../api/d_auth/v1_auth_google_token_post/dist/layer.zip"
      runtime          = null  # 해당 람다에 대해서 변경하고 싶다면 null 말고 다른 값을 넣으면 된다
      runtime_version  = null  # 해당 람다에 대해서 변경하고 싶다면 null 말고 다른 값을 넣으면 된다
    }
    v1_auth_signup_post = {
      route_key        = "POST /auth/sign-up"
      is_authorized    = false
      handler          = "d_auth.v1_auth_signup_post.v1_auth_signup_post.lambda_handler"
      source_file_path = "../api/d_auth/v1_auth_signup_post/dist/build.zip"
      layer_file_path  = "../api/d_auth/v1_auth_signup_post/dist/layer.zip"
      runtime          = null  # 해당 람다에 대해서 변경하고 싶다면 null 말고 다른 값을 넣으면 된다
      runtime_version  = null  # 해당 람다에 대해서 변경하고 싶다면 null 말고 다른 값을 넣으면 된다
    }
    v1_auth_signin_post = {
      route_key        = "POST /auth/sign-in"
      is_authorized    = false
      handler          = "d_auth.v1_auth_signin_post.v1_auth_signin_post.lambda_handler"
      source_file_path = "../api/d_auth/v1_auth_signin_post/dist/build.zip"
      layer_file_path  = "../api/d_auth/v1_auth_signin_post/dist/layer.zip"
      runtime          = null  # 해당 람다에 대해서 변경하고 싶다면 null 말고 다른 값을 넣으면 된다
      runtime_version  = null  # 해당 람다에 대해서 변경하고 싶다면 null 말고 다른 값을 넣으면 된다
    }
    v1_auth_user_name_get = {
      route_key        = "GET /auth/user/{name}"
      is_authorized    = false
      handler          = "d_auth.v1_auth_user_name_get.v1_auth_user_name_get.lambda_handler"
      source_file_path = "../api/d_auth/v1_auth_user_name_get/dist/build.zip"
      layer_file_path  = "../api/d_auth/v1_auth_user_name_get/dist/layer.zip"
      runtime          = null  # 해당 람다에 대해서 변경하고 싶다면 null 말고 다른 값을 넣으면 된다
      runtime_version  = null  # 해당 람다에 대해서 변경하고 싶다면 null 말고 다른 값을 넣으면 된다
    }

    v1_auth_sms_code_post = {
      route_key        = "POST /auth/sms/code"
      is_authorized    = false
      handler          = "d_auth.v1_auth_sms_code_post.v1_auth_sms_code_post.lambda_handler"
      source_file_path = "../api/d_auth/v1_auth_sms_code_post/dist/build.zip"
      layer_file_path  = "../api/d_auth/v1_auth_sms_code_post/dist/layer.zip"
      runtime          = null  # 해당 람다에 대해서 변경하고 싶다면 null 말고 다른 값을 넣으면 된다
      runtime_version  = null  # 해당 람다에 대해서 변경하고 싶다면 null 말고 다른 값을 넣으면 된다
    }
    v1_auth_phone_post = {
      route_key        = "POST /auth/phone"
      is_authorized    = false
      handler          = "d_auth.v1_auth_phone_post.v1_auth_phone_post.lambda_handler"
      source_file_path = "../api/d_auth/v1_auth_phone_post/dist/build.zip"
      layer_file_path  = "../api/d_auth/v1_auth_phone_post/dist/layer.zip"
      runtime          = null  # 해당 람다에 대해서 변경하고 싶다면 null 말고 다른 값을 넣으면 된다
      runtime_version  = null  # 해당 람다에 대해서 변경하고 싶다면 null 말고 다른 값을 넣으면 된다
    }
  }
}


module "monter_api_lambda" {
  source = "../../module/lambda"

  env          = var.env
  project_prop = var.project_prop

  dynamodb_name_pattern = var.dynamodb_name_pattern
  postgres_prop         = var.postgres_prop
  twilio_prop           = var.twilio_prop

  iam_prop = {
    aws_iam_role_arn : aws_iam_role.auth_domain_iam_for_lambda_role.arn
    #    aws_iam_role_arn : var.iam_prop.aws_iam_role_arn  # default iam role
  }

  for_each = var.function_list

  function_prop = {
    function_name : each.key
    handler : each.value["handler"]
  }

  lambda_prop = {
    runtime         = each.value["runtime"] != null ? each.value["runtime"] : var.lambda_prop.runtime
    runtime_version = each.value["runtime_version"] != null ? each.value["runtime_version"] : var.lambda_prop.runtime_version

    memory_size : var.lambda_prop.memory_size
    lambda_timeout_time : var.lambda_prop.lambda_timeout_time
    architectures : var.lambda_prop.architectures
  }

  source_file_path = each.value["source_file_path"]
  layer_file_path  = each.value["layer_file_path"]

  monter_common_layer_arn = var.monter_common_layer_arn

  jwt_secret_key = var.jwt_secret_key
}

module "monter_api_lambda_attachments" {
  source = "../../module/apigatewayv2_attachments"

  env                 = var.env
  api_gateway_v2_prop = var.api_gateway_v2_prop

  for_each = {
    for k, v in module.monter_api_lambda : k => {
      function_name : v.out.function_name
      invoke_arn : v.out.invoke_arn
      route_key : var.function_list[k]["route_key"]
      is_authorized : var.function_list[k]["is_authorized"]

    }
  }

  function_prop = {
    function_name : each.value["function_name"]
  }

  lambda_invoke_arn = each.value["invoke_arn"]
  route_key         = each.value["route_key"]
  is_authorized     = each.value["is_authorized"]
}
