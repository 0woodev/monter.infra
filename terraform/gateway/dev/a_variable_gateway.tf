variable "gateway_prop" {
  description = "Values of gateway prop"
  type        = map(string)
  default     = {
    api_gateway_name : "not-assigned"
  }
}