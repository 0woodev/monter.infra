variable "dynamodb_name_pattern" {
  description = "dynamo db name pattern"
  type        = string
  default     = "not-assigned"
}

variable "postgres_prop" {
  description = "dynamo db name pattern"
  type        = map(any)
  default     = {
    endpoint : "not-assigned"
    port : "not-assigned"
  }
}
