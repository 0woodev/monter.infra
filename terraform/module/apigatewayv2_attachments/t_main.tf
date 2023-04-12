resource "aws_apigatewayv2_integration" "monter_aws_apigatewayv2_integration" {
  api_id           = var.api_gateway_v2_prop.id
  integration_type = "AWS_PROXY"

  connection_type      = "INTERNET"
  description          = "Lambda ${var.function_prop.function_name}"
  integration_method   = "POST"
  integration_uri      = var.lambda_invoke_arn
  passthrough_behavior = "WHEN_NO_MATCH"
}

resource "aws_apigatewayv2_route" "monter_aws_apigatewayv2_route" {
  api_id    = var.api_gateway_v2_prop.id
  route_key = var.route_key

  authorizer_id      = var.is_authorized == true ? var.api_gateway_v2_prop.authorizer_id : null
  authorization_type = var.is_authorized != false ? "CUSTOM" : null
  target             = "integrations/${aws_apigatewayv2_integration.monter_aws_apigatewayv2_integration.id}"
}

resource "aws_lambda_permission" "monter_lambda_permission_v1" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = var.function_prop.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = replace("arn:aws:execute-api:${var.env.region}:${var.env.accountId}:${var.api_gateway_v2_prop.id}/*/${aws_apigatewayv2_route.monter_aws_apigatewayv2_route.route_key}", " ", "")
}

