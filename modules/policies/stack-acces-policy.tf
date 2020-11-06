variable "general_channel_access_policy" {
  description = "The general Spacelift stack access policy as described here: https://docs.spacelift.io/concepts/policy/stack-access-policy. `package` information is already set."
  default     = ""
  type        = string
}
variable "general_channel_access_policy_name" {
  default = ""
  type    = string
}

locals {
  general_channel_access_policy = {
    policy_type = "STACK_ACCESS"
    policy      = <<EOF
package spacelift
# ATTENTION: This is generated policy deloyed with Terraform.
# Reference: general_channel_access_policy
${var.general_channel_access_policy}
EOF
  }
}

resource spacelift_policy general_channel_access_policy {
  count = length(var.general_channel_access_policy_name) > 0 ? 1 : 0
  name  = var.general_channel_access_policy_name
  body  = local.general_channel_access_policy.policy
  type  = local.general_channel_access_policy.policy_type
}

output general_channel_access_policy {
  description = "This is a general Spacelift stack access policy as described here: https://docs.spacelift.io/concepts/policy/stack-access-policy"
  value       = local.general_channel_access_policy
}
output general_channel_access_policy_id {
  value = length(var.general_channel_access_policy_name) > 0 ? spacelift_policy.general_channel_access_policy[0].id : ""
}
