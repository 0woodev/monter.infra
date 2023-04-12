variable "env" {
  description = "Values of infra environments"
  type        = map(string)
  default     = {
    region : "ap-northeast-2"
    accountId: "308340476166"
  }
}