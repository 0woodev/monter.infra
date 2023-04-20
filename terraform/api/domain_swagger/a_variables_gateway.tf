variable "api_gateway_v2_prop" {
  description = "Value of accountId"
  type        = map(string)
  default = {
    id : "not-assigned"
    arn : "not-assigned"
    authorizer_id : "not-assigned"
  }
}
