# Usage
<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| terraform | >=0.12.26, <0.14 |

## Providers

| Name | Version |
|------|---------|
| spacelift | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| default\_git\_branch | The branch of the GIT repository e.g. `master` or `development`. | `string` | `"master"` | no |
| general\_channel\_access\_policy | The general Spacelift stack access policy as described here: https://docs.spacelift.io/concepts/policy/stack-access-policy. `package` information is already set. | `string` | `""` | no |
| general\_channel\_access\_policy\_name | n/a | `string` | `""` | no |
| repository\_base\_path | The path to the stack inside the GIT repository. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| general\_channel\_access\_policy | This is a general Spacelift stack access policy as described here: https://docs.spacelift.io/concepts/policy/stack-access-policy |
| general\_channel\_access\_policy\_id | n/a |
| multi\_module\_repo\_apply\_on\_master | `track` triggers a `terraform plan` with along with the possibility to confirm the plan on the infrastructure. |
| multi\_module\_repo\_plan\_on\_branch | `propose` will run a `terraform plan` without the possiblity of confirm it with a `terraform apply` afterwards. |

<!--- END_TF_DOCS --->
