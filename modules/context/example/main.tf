terraform {
  required_version = ">=0.12.6, <0.14"
}

locals {
  terraformrc = <<-EOT
credentials "reg.suvi.vbg.de" {
  token = "my-little-secret"
}
EOT
}

module "terraformrc" {
  source = "../"

  description = "Provide .terraformrc as mounted file."
  name        = ".terraformrc"
  #  stack_attachments = [
  #    {
  #      stack_name = "test"
  #      priority   = 0
  #    }
  #  ]
  mounted_files = {
    ".terraformrc" = {
      base64_content = base64encode(local.terraformrc)
    }
  }
  environment_variables = {
    "TF_CLI_CONFIG_FILE" = {
      value      = "/mnt/workspace/.terraformrc"
      write_only = false
    }
  }
}