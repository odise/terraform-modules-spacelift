# Usage
<!--- BEGIN_TF_DOCS --->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| google | n/a |
| spacelift | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| gcp\_project\_name | GCP project name | `string` | `""` | no |
| spacelift\_policies | n/a | <pre>map(object({<br>    policy      = string<br>    policy_type = string<br>  }))</pre> | `{}` | no |
| spacelift\_policies\_objects | n/a | `any` | `null` | no |
| spacelift\_sa\_iam\_roles | n/a | `list` | `[]` | no |
| spacelift\_stack\_environment\_variables | n/a | <pre>map(object({<br>    value      = string<br>    write_only = string<br>  }))</pre> | `{}` | no |
| spacelift\_token\_scopes | n/a | `list` | <pre>[<br>  "https://www.googleapis.com/auth/compute",<br>  "https://www.googleapis.com/auth/cloud-platform",<br>  "https://www.googleapis.com/auth/devstorage.full_control",<br>  "https://www.googleapis.com/auth/ndev.clouddns.readwrite",<br>  "https://www.googleapis.com/auth/userinfo.email"<br>]</pre> | no |
| stack\_administrative | n/a | `bool` | `false` | no |
| stack\_autodeploy | n/a | `bool` | `false` | no |
| stack\_base\_dev\_path | n/a | `string` | `"/"` | no |
| stack\_branch | n/a | `string` | `"master"` | no |
| stack\_description | n/a | `string` | `""` | no |
| stack\_id | Provide a stack Id instead of creating a stack. | `string` | `""` | no |
| stack\_manage\_state | n/a | `bool` | `false` | no |
| stack\_name | n/a | `string` | `""` | no |
| stack\_repository | n/a | `string` | `""` | no |
| stack\_terraform\_version | n/a | `string` | `"0.13.0"` | no |

## Outputs

No output.

<!--- END_TF_DOCS --->
