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

