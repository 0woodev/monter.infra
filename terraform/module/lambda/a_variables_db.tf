variable "dynamodb_name_pattern" {
  description = "dynamo db name pattern"
  type        = string
  default     = "not-assigned"
}

variable "postgres_prop" {
  description = "postgres property"
  type        = map(any)
  default     = {
    endpoint : "not-assigned"
    port : "not-assigned"
    schema_name: "not-assigned"
    user: "not-assigned"
    password: "not-assigned"
  }
}