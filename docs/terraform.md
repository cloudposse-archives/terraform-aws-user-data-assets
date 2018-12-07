
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| backup_enabled | Enable backup assets to s3 on cron | string | `false` | no |
| backup_frequency | Frequency backup assets on cron | string | `0 0 1 * *` | no |
| bucket | S3 bucket to store assets | string | - | yes |
| dir | Directory path where assets stored on server | string | - | yes |
| flavor | Flavor depends of OS and init system | string | `debian-systemd` | no |
| name |  | string | - | yes |
| namespace |  | string | - | yes |
| ssh_user | User that used to execute backup cron | string | - | yes |
| stage |  | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| policy_arn | description here |
| user_data | description here |

