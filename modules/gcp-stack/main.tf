provider "spacelift" {}

resource google_project_iam_member this {
  for_each = toset(var.spacelift_sa_iam_roles)
  project  = var.gcp_project_name
  role     = each.key
  member   = "serviceAccount:${spacelift_stack_gcp_service_account.this.service_account_email}"
}

resource spacelift_stack this {
  name              = var.stack_name
  administrative    = var.stack_administrative
  autodeploy        = var.stack_autodeploy
  branch            = var.stack_branch
  description       = var.stack_description
  repository        = var.stack_repository
  manage_state      = var.stack_manage_state
  project_root      = var.stack_base_dev_path
  terraform_version = var.stack_terraform_version
}

resource spacelift_stack_gcp_service_account this {
  stack_id     = spacelift_stack.this.id
  token_scopes = var.spacelift_token_scopes
}

resource spacelift_policy this {
  for_each = var.spacelift_policies
  name     = each.key
  body     = each.value.policy
  type     = each.value.policy_type
}

resource spacelift_policy_attachment this {
  for_each  = var.spacelift_policies
  policy_id = spacelift_policy.this[each.key].id
  stack_id  = spacelift_stack.this.id
}
