# set this with TF_VAR_xxx 
variable gcp_project_name {
  type        = string
  description = "GCP project name"
}

module policies {
  source               = "../../modules/policies"
  repository_base_path = "stacks/gcp-stack"
  default_git_branch   = "master"
}

module example_stack {
  source = "../../modules/gcp-stack"

  stack_name       = "GCP Test Stack"
  gcp_project_name = var.gcp_project_name
  spacelift_sa_iam_roles = [
    # "role/owner"
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

  spacelift_policies = merge(
    module.policies.multi_module_repo_plan_on_branch,
    module.policies.multi_module_repo_apply_on_master
  )
}
