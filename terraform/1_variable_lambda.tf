variable "lambda_architectures" {
  description = "identifier of db resource group"
  type        = string
  default     = "arm64"
}

variable "lambda_runtime" {
  description = "runtime of lambda(=langauge)"
  type        = string
  default     = "python"
}

variable "lambda_runtime_version" {
  description = "version of runtime"
  type        = string
  default     = "3.9"
}

variable "lambda_memory_size" {
  description = "memory_size of lambda"
  type        = number
  default     = 128 * 8
}

variable "lambda_timeout_time" {
  description = "time of timeout"
  type        = number
  default     = 60
}
