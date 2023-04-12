variable "lambda_architectures" {
  description = "identifier of db resource group"
  type        = string
  default     = "x86_64"
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
