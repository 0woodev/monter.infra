variable "project_prop" {
  description = "props of project"
  type        = map(string)
  default     = {
    project_name : "not-assigned"
    stage_name : "not-assigned"
  }
}
