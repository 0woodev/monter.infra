resource "aws_apigatewayv2_api" "monter_server_gateway" {
  name = "${var.project_prop.project_name}_${var.gateway_prop.api_gateway_name}"
  description = "worker: ${var.project_prop.project_name}"
  protocol_type = "HTTP"
  route_selection_expression = "$request.method $request.path"

  cors_configuration {
    allow_credentials = null
#    allow_headers     = ["*"]
    allow_headers     = ["content-type", "x-amz-date", "authorization", "x-api-key", "x-amz-security-token", "x-amz-user-agent",]
    allow_methods     = ["*"]
    allow_origins     = ["http://localhost:3000", "http://localhost:3001", "https://tbd-alpha.vercel.app"]
    expose_headers    = null
    max_age           = 86400
  }
}

resource "aws_cloudwatch_log_group" "monter_apigatewayv2_cloudwatch_log_group" {
  name = "/aws/apigatewayv2/${aws_apigatewayv2_api.monter_server_gateway.name}"
  retention_in_days = 1
}

resource "aws_apigatewayv2_stage" "dev" {
  api_id = aws_apigatewayv2_api.monter_server_gateway.id
  name   = "dev"

  auto_deploy = true

  stage_variables = {
    stage_name = "dev"
    developMode = var.project_prop.stage_name
  }

  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.monter_apigatewayv2_cloudwatch_log_group.arn
    format          = "$context.identity.sourceIp [$context.requestId] \"$context.protocol $context.routeKey\" $context.status userId:$context.authorizer.userId principalId=$context.authorizer.principalId $context.authorizer.error $context.authorizer.status $context.error.message $context.integrationErrorMessage"
  }
}

resource "aws_apigatewayv2_stage" "stage" {
  api_id = aws_apigatewayv2_api.monter_server_gateway.id
  name   = "stage"

  stage_variables = {
    stage_name = "stage"
    developMode = var.project_prop.stage_name
  }

  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.monter_apigatewayv2_cloudwatch_log_group.arn
    format          = "$context.identity.sourceIp [$context.requestId] \"$context.protocol $context.routeKey\" $context.status userId:$context.authorizer.userId principalId=$context.authorizer.principalId $context.authorizer.error $context.authorizer.status $context.error.message $context.integrationErrorMessage"
  }
}

#resource "aws_apigatewayv2_stage" "live" {
#  api_id = ""
#  name   = "v1"
#}