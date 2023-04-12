output "out" {
  value = {
    api_gateway_id : module.monter_api_gatewayv2.out.api_gateway_id
    api_gateway_arn : module.monter_api_gatewayv2.out.api_gateway_arn
    authorizer_id : module.monter_api_gatewayv2.out.authorizer_id
    root_resource_id : false
  }
}