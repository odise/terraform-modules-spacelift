variable gcp_project_name {
  type        = string
  description = "GCP project name"
}

variable stack_id {
  type        = string
  default     = ""
  description = "Provide a stack Id instead of creating a stack."
}

variable spacelift_sa_iam_roles {
  type    = list
  default = []
}

variable stack_name {
  type = string
}
variable stack_administrative {
  type    = bool
  default = false
}
variable stack_autodeploy {
  type    = bool
  default = false
}
variable stack_branch {
  type    = string
  default = "master"
}
variable stack_description {
  type    = string
  default = ""
}
variable stack_repository {
  type = string
}
variable stack_manage_state {
  type    = bool
  default = false
}
variable stack_base_dev_path {
  type    = string
  default = "/"
}
variable stack_terraform_version {
  type    = string
  default = "0.13.0"
}

variable spacelift_token_scopes {
  type = list
  default = [
    "https://www.googleapis.com/auth/compute",
    "https://www.googleapis.com/auth/cloud-platform",
    "https://www.googleapis.com/auth/devstorage.full_control",
    "https://www.googleapis.com/auth/ndev.clouddns.readwrite",
    "https://www.googleapis.com/auth/userinfo.email",
  ]
}

variable spacelift_policies {
  type = map(object({
    policy      = string
    policy_type = string
  }))
  default = {}
}
variable "spacelift_policies_objects" {
  default = null
}

variable spacelift_stack_environment_variables {
  type = map(object({
    value      = string
    write_only = string
  }))
  default = {}
}
