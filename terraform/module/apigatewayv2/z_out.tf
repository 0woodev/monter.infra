output "out" {
  value = {
    api_gateway_id : aws_apigatewayv2_api.monter_server_gateway.id
    api_gateway_arn : aws_apigatewayv2_api.monter_server_gateway.arn
    authorizer_id : "not-assigned-yet"
  }
}