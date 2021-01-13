variable "description" {
  default = ""
  type    = string
}
variable "name" {
  default = ""
  type    = string
}
variable "spacelift_project_path" {
  default = "/mnt/workspace/"
  type    = string
}
variable "stack_attachments" {
  type = map(object({
    priority = number
  }))
  default = {}
}
variable "mounted_files" {
  type = map(object({
    base64_content = string
  }))
  default = {}
}
variable "environment_variables" {
  type = map(object({
    value      = string
    write_only = bool
  }))
  default = {}
}
