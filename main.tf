data "cloudflare_zone" "this" {
  count = var.zone_name != "" ? 1 : 0
  name  = var.zone_name
}

resource "cloudflare_page_rule" "page_rules" {
  for_each = { for page_rule in var.page_rules : page_rule.target => page_rule }
  target   = each.value.target
  priority = try(each.value.priority, null)
  zone_id  = try(each.value.zone_id, data.cloudflare_zone.this[0].id)

  dynamic "actions" {
    for_each = each.value.actions
    content {
      always_use_https            = try(actions.value.always_use_https, null)
      automatic_https_rewrites    = try(actions.value.automatic_https_rewrites, null)
      browser_cache_ttl           = try(actions.value.browser_cache_ttl, null)
      browser_check               = try(actions.value.browser_check, null)
      bypass_cache_on_cookie      = try(actions.value.bypass_cache_on_cookie, null)
      cache_by_device_type        = try(actions.value.cache_by_device_type, null)
      cache_deception_armor       = try(actions.value.cache_deception_armor, null)
      cache_level                 = try(actions.value.cache_level, null)
      cache_on_cookie             = try(actions.value.cache_on_cookie, null)
      disable_apps                = try(actions.value.disable_apps, null)
      disable_performance         = try(actions.value.disable_performance, null)
      disable_railgun             = try(actions.value.disable_railgun, null)
      disable_security            = try(actions.value.disable_security, null)
      disable_zaraz               = try(actions.value.disable_zaraz, null)
      edge_cache_ttl              = try(actions.value.edge_cache_ttl, null)
      email_obfuscation           = try(actions.value.email_obfuscation, null)
      explicit_cache_control      = try(actions.value.explicit_cache_control, null)
      host_header_override        = try(actions.value.host_header_override, null)
      ip_geolocation              = try(actions.value.ip_geolocation, null)
      mirage                      = try(actions.value.mirage, null)
      opportunistic_encryption    = try(actions.value.opportunistic_encryption, null)
      origin_error_page_pass_thru = try(actions.value.origin_error_page_pass_thru, null)
      polish                      = try(actions.value.polish, null)
      resolve_override            = try(actions.value.resolve_override, null)
      respect_strong_etag         = try(actions.value.respect_strong_etag, null)
      response_buffering          = try(actions.value.response_buffering, null)
      rocket_loader               = try(actions.value.rocket_loader, null)
      security_level              = try(actions.value.security_level, null)
      server_side_exclude         = try(actions.value.server_side_exclude, null)
      sort_query_string_for_cache = try(actions.value.sort_query_string_for_cache, null)
      ssl                         = try(actions.value.ssl, null)
      true_client_ip_header       = try(actions.value.true_client_ip_header, null)
      waf                         = try(actions.value.waf, null)

      dynamic "forwarding_url" {
        for_each = try(actions.value.forwarding_url, [])
        content {
          url         = forwarding_url.value.url
          status_code = forwarding_url.value.status_code
        }
      }
      # TODO
      #   dynamic "cache_key_fields" {
      #     for_each = try(actions.value.cache_key_fields, [])
      #     content = {

      #     }
      #   }
      dynamic "cache_ttl_by_status" {
        for_each = try(actions.value.cache_ttl_by_status, [])
        content {
          codes = cache_ttl_by_status.value.codes
          ttl   = cache_ttl_by_status.value.ttl
        }
      }
      dynamic "minify" {
        for_each = try(actions.value.minify, [])
        content {
          html = minify.value.html
          css  = minify.value.css
          js   = minify.value.js
        }
      }
    }
  }
}
