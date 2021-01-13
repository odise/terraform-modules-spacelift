<!--- BEGIN_TF_DOCS ---> 
## Requirements

| Name | Version |
|------|---------|
| terraform | >=0.12.6, <0.14 |
| spacelift | 1.0.0 |

## Providers

| Name | Version |
|------|---------|
| spacelift | 1.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| description | n/a | `string` | `""` | no |
| environment\_variables | n/a | <pre>map(object({<br>    value      = string<br>    write_only = bool<br>  }))</pre> | `{}` | no |
| mounted\_files | n/a | <pre>map(object({<br>    base64_content = string<br>  }))</pre> | `{}` | no |
| name | n/a | `string` | `""` | no |
| spacelift\_project\_path | n/a | `string` | `"/mnt/workspace/"` | no |
| stack\_attachments | n/a | <pre>map(object({<br>    priority = number<br>  }))</pre> | `{}` | no |

## Outputs

No output.

<!--- END_TF_DOCS --->