
variable "lambda_prop" {
  description = "props of lambda"
  type        = map
  default     = {
    architectures : "not-assigned"
    runtime : "not-assigned"
    runtime_version : "not-assigned"
    memory_size : 128 * 8
    lambda_timeout_time : 60
  }
}

variable "monter_common_layer_arn" {
  description = "Value of monter_common_layer_arn"
  type        = string
  default     = null
}
