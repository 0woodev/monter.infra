variable "function_prop" {
  description = "Name of function"
  type        = map(string)
  default     = {
    function_name: "not-assigned"
  }
}

variable "lambda_prop" {
  description = "props of lambda"
  type        = map
  default     = {
    architectures : "not-assigned"
    runtime : "not-assigned"
    runtime_version : "not-assigned"
  }
}

variable "layer_file_path" {
  description = "Path of layer_file"
  type        = string
  default     = "not-assigned"
}

