variable "zone_name" {
  description = "(Optional) The DNS zone name to add the page rule to. Must be specified as zone_id on the records, or on this variable."
  type        = string
  default     = ""
}

variable "page_rules" {
  description = "Page rules to be deployed, check https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/page_rule for input structure"
  type        = list(any)

}
