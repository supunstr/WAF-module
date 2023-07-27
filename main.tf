provider "aws" {
  region = var.aws_region
}

resource "aws_wafv2_ip_set" "example" {

  name               = "example"
  description        = "Example IP set"
  scope              = "CLOUDFRONT"
  ip_address_version = "IPV4"
  addresses          = ["1.2.3.4/32", "5.6.7.8/32"]

  tags = {
    Tag1 = "Value1"
    Tag2 = "Value2"
  }
}

resource "aws_wafv2_web_acl" "waf-magri" {
  name  = "WAF-APP-ACL"
  scope = "CLOUDFRONT"

  default_action {
    allow {}
  }

  dynamic "rule" {
    for_each = var.rules

    content {
      name     = rule.value.name
      priority = rule.value.priority
      override_action {
        none {}
      }

      statement {
        managed_rule_group_statement {
          name        = rule.value.managed_rule_group_statement_name
          vendor_name = rule.value.managed_rule_group_statement_vendor_name
          dynamic "excluded_rule" {
            for_each = rule.value.listasd != null ? toset(rule.value.listasd) : []

            content {
              name = excluded_rule.value
            }
          }

          dynamic "scope_down_statement" {
            for_each = rule.value.ip_set_reference == true ? [1] : []
            content {
              not_statement {
                statement {
                  ip_set_reference_statement {
                    arn = aws_wafv2_ip_set.example.arn
                  }
                }
              }
            }
          }
        }
      }

      visibility_config {
        cloudwatch_metrics_enabled = true
        metric_name                = rule.value.metric_name
        sampled_requests_enabled   = true
      }
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "WAF-MAGRI-ACL"
    sampled_requests_enabled   = true
  }
}
