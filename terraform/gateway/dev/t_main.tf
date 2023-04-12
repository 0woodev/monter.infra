module "monter_api_gatewayv2" {
  source = "../../module/apigatewayv2"

  env          = var.env
  gateway_prop = var.gateway_prop

  project_prop = var.project_prop
  lambda_prop  = var.lambda_prop

  dynamodb_name_pattern = var.dynamodb_name_pattern
  postgres_prop         = var.postgres_prop
}