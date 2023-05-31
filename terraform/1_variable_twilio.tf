variable "from" {
  # 외부 rdb 를 사용하는 경우 해당 db 의 endpoint
  description = "postgres db name"
  type        = string
  default     = "not-assigned"
}

variable "account_sid" {
  # 외부 rdb 를 사용하는 경우 해당 db 의 포트
  description = "postgres db user"
  type        = string
  default     = "not-assigned"
}

variable "auth_token" {
  # 외부 rdb 를 사용하는 경우 해당 db 의 endpoint
  description = "postgres db password"
  type        = string
  default     = "not-assigned"
}