terraform {
  source = "./"
}

inputs = {
  aws_region     = "us-east-1"
  aws_account_id = "925307459448"

 rules = {
    0 = {
      name = "AWS-AWSManagedRulesBotControlRuleSet"
      priority = 0
      managed_rule_group_statement_name = "AWSManagedRulesBotControlRuleSet"
      managed_rule_group_statement_vendor_name = "AWS"
      metric_name = "AWS-AWSManagedRulesBotControlRuleSet"
      listasd = ["CategoryHttpLibrary", "CategoryScoalMedia"]
      ip_set_reference = true
    },
    1 = {
      name = "AWS-AWSManagedRulesCommonRuleSet"
      priority = 1
      managed_rule_group_statement_name = "AWSManagedRulesCommonRuleSet"
      managed_rule_group_statement_vendor_name = "AWS"
      metric_name = "AWS-AWSManagedRulesCommonRuleSet"
      listasd = ["GenericRFI_BODY", "SizeRestrictions_BODY", "SizeRestrictions_URIPATH"]
      ip_set_reference = false
    },
  }
}

