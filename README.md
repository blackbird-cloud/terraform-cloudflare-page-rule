## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | 3.16 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | 3.16 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_page_rule.page_rules](https://registry.terraform.io/providers/cloudflare/cloudflare/3.16/docs/resources/page_rule) | resource |
| [cloudflare_zone.this](https://registry.terraform.io/providers/cloudflare/cloudflare/3.16/docs/data-sources/zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_page_rules"></a> [page\_rules](#input\_page\_rules) | Page rules to be deployed, check https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/page_rule for input structure | `list(any)` | n/a | yes |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | (Optional) The DNS zone name to add the page rule to. Must be specified as zone\_id on the records, or on this variable. | `string` | `""` | no |

## Outputs

No outputs.
