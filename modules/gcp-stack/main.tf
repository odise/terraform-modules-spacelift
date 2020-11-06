provider "spacelift" {}

terraform {
  required_providers {
    spacelift = {
      source = "spacelift.io/spacelift-io/spacelift"
    }
  }
}

data spacelift_stack self {
  count    = length(var.stack_id) > 0 ? 1 : 0
  stack_id = var.stack_id
}

locals {
  stack_id = length(var.stack_id) > 0 ? data.spacelift_stack.self.stack_id : spacelift_stack.this.id
}

resource google_project_iam_member this {
  for_each = toset(var.spacelift_sa_iam_roles)
  project  = var.gcp_project_name
  role     = each.key
  member   = "serviceAccount:${spacelift_gcp_service_account.this.service_account_email}"
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

resource spacelift_gcp_service_account this {
  stack_id     = local.stack_id
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
  stack_id  = local.stack_id
}

resource spacelift_policy_attachment external {
  count     = length(var.spacelift_policies_objects)
  policy_id = var.spacelift_policies_objects[count.index]
  stack_id  = local.stack_id
}

resource spacelift_environment_variable this {
  for_each   = var.spacelift_stack_environment_variables
  stack_id   = local.stack_id
  name       = each.key
  value      = each.value.value
  write_only = each.value.write_only
}
