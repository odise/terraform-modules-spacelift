resource "spacelift_context" "this" {
  description = var.description
  name        = var.name
}

resource "spacelift_context_attachment" "this" {
  for_each   = var.stack_attachments
  context_id = spacelift_context.this.id
  stack_id   = each.key
  priority   = lookup(each.value, "priority", 0)
}

resource "spacelift_mounted_file" "this" {
  for_each      = var.mounted_files
  context_id    = spacelift_context.this.id
  relative_path = "${var.spacelift_project_path}${each.key}"
  content       = lookup(each.value, "base64_content", "")
}

resource "spacelift_environment_variable" "this" {
  for_each   = var.environment_variables
  context_id = spacelift_context.this.id
  name       = each.key
  value      = lookup(each.value, "value", "")
  # Also note that if write_only is set to true, the value is not stored in the state,
  # and will not be reported back by either the data source or the resource. Instead,
  # its SHA-256 checksum will be used to compare the new value to the one passed to Spacelift.
  write_only = lookup(each.value, "write_only", false)
}