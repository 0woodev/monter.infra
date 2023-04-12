variable "function_prop" {
  description = "Name of function"
  type        = map(string)
  default     = {
    function_name: "not-assigned"
    handler: "not-assigned"
  }
}

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

variable "source_file_path" {
  description = "Path of source_file"
  type        = string
  default     = "not-assigned"
}

variable "layer_file_path" {
  description = "Path of layer_file"
  type        = string
  default     = "not-assigned"
}

