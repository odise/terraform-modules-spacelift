variable default_git_branch {
  description = "The branch of the GIT repository e.g. `master` or `development`."
  type        = string
  default     = "master"
}

variable repository_base_path {
  description = "The path to the stack inside the GIT repository."
  type        = string
  default     = ""
}

locals {
  multi_module_repo_apply_on_master_description = "`track` triggers a `terraform plan` with along with the possibility to confirm the plan on the infrastructure."
}
output multi_module_repo_apply_on_master {
  description = local.multi_module_repo_apply_on_master_description
  # XXX: incorporate `project_root` here.
  default = {
    policy      = <<EOF
package spacelift
# ATTENTION: This is generated policy deloyed with Terraform.
# DESCRIPTION:
# ${local.multi_module_repo_apply_on_master_description}
track {
    # only do this on the ${var.default_git_branch} branch
    input.push.branch == ${var.default_git_branch}
    # only trigger it on the relevant path of our multi-module repository
    filepath := input.push.affected_files[_]
    startswith(filepath, "${var.repository_base_path}")
}
EOF
    policy_type = "GIT_PUSH"
  }
}

locals {
  multi_module_repo_plan_on_branch_description = "`propose` will run a `terraform plan` without the possiblity of confirm it with a `terraform apply` afterwards."
}
output multi_module_repo_plan_on_branch {
  description = local.multi_module_repo_plan_on_branch_description
  default = {
    policy      = <<EOF
package spacelift
# ATTENTION: This is generated policy deloyed with Terraform.
# DESCRIPTION:
# ${local.multi_module_repo_plan_on_branch_description}
propose {
    # we want to do this on all branches except of ${var.default_git_branch} 
    input.push.branch != ${var.default_git_branch}
    # we want to do this on an specific path of our multi-module repository. In this case this is ${var.repository_base_branch}.
    filepath := input.push.affected_files[_]
    startswith(filepath, "${var.repository_base_path}")
EOF
    policy_type = "GIT_PUSH"
  }
}
