terraform {
  source = "./"
}

inputs = {
  aws_region     = "us-east-1"
  aws_account_id = "925307459448"


 rules = {
    0 = {
      name = "AWS-AWSManagedRulesKnownBadInputsRuleSet"
      priority = 0
      managed_rule_group_statement_name = "AWSManagedRulesKnownBadInputsRuleSet"
      managed_rule_group_statement_vendor_name = "AWS"
      metric_name = "AWS-AWSManagedRulesKnownBadInputsRuleSet"
    },
    1 = {
      name = "AWS-AWSManagedRulesAdminProtectionRuleSet"
      priority = 1
      managed_rule_group_statement_name = "AWSManagedRulesAdminProtectionRuleSet"
      managed_rule_group_statement_vendor_name = "AWS"
      metric_name = "AWS-AWSManagedRulesAdminProtectionRuleSet"
      listasd = ["SizeRestrictions_BODY", "SizeRestrictions_URIPATH"]
    },
  }


}

