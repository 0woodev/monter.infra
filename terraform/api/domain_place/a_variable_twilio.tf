variable "twilio_prop" {
  description = "postgres property"
  type        = map(any)
  default     = {
    from : "not-assigned"
    account_sid : "not-assigned"
    auth_token: "not-assigned"
  }
}