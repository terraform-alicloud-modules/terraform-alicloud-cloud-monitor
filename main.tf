provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/cloud-monitor"
}

locals {
  create_more_resources = var.using_existing_id != true || var.existing_instance_id == "" || var.create_instance ? true : false
  alarm_rule_dimensions = flatten(
  [
  for index, dimensions in var.alarm_rule_dimensions : {
    instanceId = dimensions["instanceId"]
    device = dimensions["device"]
  }
  ]
  )
}

resource "alicloud_cms_alarm" "cms" {
  count              = local.create_more_resources || var.enabled_alarm_rule ? 1 : 0
  enabled            = var.enabled_alarm_rule
  metric             = var.alarm_rule_metric
  name               = var.alarm_rule_name
  project            = var.alarm_rule_project
  threshold          = var.alarm_rule_threshold
  period             = var.alarm_rule_period
  statistics         = var.alarm_rule_statistics
  operator           = var.alarm_rule_operator
  triggered_count    = var.alarm_rule_triggered_count
  contact_groups     = var.alarm_rule_contact_groups
  effective_interval = var.alarm_rule_effective_interval
  silence_time       = var.alarm_rule_silence_time
  webhook            = var.alarm_rule_webhook
  dimensions = {
    instanceId = lookup(local.alarm_rule_dimensions[count.index], "instanceId")
    device     = lookup(local.alarm_rule_dimensions[count.index], "device")
  }
}
