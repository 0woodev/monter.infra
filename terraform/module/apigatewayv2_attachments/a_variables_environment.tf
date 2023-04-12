variable "env" {
  description = "Value of accountId"
  type        = map(any)
  default = {
    region : "not-assigned"
    accountId : "not-assigned"
  }
}
