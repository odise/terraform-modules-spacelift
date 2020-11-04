# set this with TF_VAR_xxx 
variable gcp_project_name {
  type        = string
  description = "GCP project name"
}

variable name {
  type    = string
  default = "GCP Test Stack"
}

variable main_branch {
  type    = string
  default = "master"
}

module policies {
  source               = "../../modules/policies"
  repository_base_path = "stacks/gcp-stack"
  default_git_branch   = var.main_branch
}

module example_stack {
  source = "../../modules/gcp-stack"

  stack_name       = var.name
  gcp_project_name = var.gcp_project_name
  spacelift_sa_iam_roles = [
    "roles/storage.admin"
  ]
  stack_administrative = false
  stack_autodeploy     = false
  stack_branch         = "gcp"
  stack_description    = "Very nice Spacelift stack example."
  stack_repository     = "terraform-test-repository"
  stack_manage_state   = true
  stack_base_dev_path  = "stacks/gcp-stack"
  # stack_terraform_version = 
  # spacelift_token_scope = 

  spacelift_policies = {
    "${var.name} terraform plan on every branch"             = module.policies.multi_module_repo_plan_on_branch,
    "${var.name} terraform apply on ${var.main_branch} only" = module.policies.multi_module_repo_apply_on_master
  }

  spacelift_stack_environment_variables = {
    TF_VAR_gcp_project_name = {
      value      = var.gcp_project_name
      write_only = true
    }
  }
}
