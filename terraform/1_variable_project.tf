variable "project_name" {
  description = "identifier of resource group"
  type        = string
  default     = "not-assigned"
}

variable "stage_name" {
  description = "Stage of resource group"
  type        = string
  default     = "not-assigned"
}

variable "dynamodb_name_pattern" {
  # dynamodb 를 사용하는 경우 활용가능
  description = "identifier of db resource group"
  type        = string
  default     = "not-assigned"
}

variable "db_endpoint" {
  # 외부 rdb 를 사용하는 경우 해당 db 의 endpoint
  description = "identifier of db resource group"
  type        = string
  default     = "not-assigned"
}

variable "db_port" {
  # 외부 rdb 를 사용하는 경우 해당 db 의 포트
  description = "identifier of db resource group"
  type        = string
  default     = "3306"
}