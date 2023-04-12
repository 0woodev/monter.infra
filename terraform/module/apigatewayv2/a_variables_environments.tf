variable "env" {
  description = "Values of infra environments"
  type        = map(string)
  default     = {
    region : "not-assigned"
    accountId : "not-assigned"
  }
}