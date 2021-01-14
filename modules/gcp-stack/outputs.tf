output "id" {
  value       = length(var.stack_id) > 0 ? "" : spacelift_stack.this[0].id
  description = "The immutable ID (slug) of the stack"
}
output "gcp_service_account_id" {
  value       = length(var.stack_id) > 0 ? "" : spacelift_gcp_service_account.this[0].id
  description = "The immutable ID (slug) of the service account attachment."
}
#output "gcp_service_account_email" {
#  value = spacelift_gcp_service_account.this.service_account_email
#}