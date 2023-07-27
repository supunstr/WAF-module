variable "aws_region" {
  type = string
}

variable "aws_account_id" {
  type = string
}

variable "rules" {
  type = map(object({
    name                                     = string
    priority                                 = number
    managed_rule_group_statement_name        = string
    managed_rule_group_statement_vendor_name = string
    metric_name                              = string
    listasd                                  = optional(list(string))
    ip_set_reference                         = bool
  }))
}

variable "rules_contains_ip_set_reference" {
  type    = bool
  default = true
}
