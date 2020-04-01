############
# cms alarm
############
output "this_alarm_rule_effective_interval" {
  description = "The interval of effecting alarm rule."
  value       = alicloud_cms_alarm.cms.*.effective_interval
}

output "this_alarm_rule_id" {
  description = "The ID of the alarm rule."
  value       = alicloud_cms_alarm.cms.*.id
}

output "this_alarm_rule_name" {
  description = "The alarm name."
  value       = alicloud_cms_alarm.cms.*.name
}

output "this_alarm_rule_project" {
  description = "Monitor project name."
  value       = alicloud_cms_alarm.cms.*.project
}

output "this_alarm_rule_metric" {
  description = "Name of the monitoring metrics."
  value       = alicloud_cms_alarm.cms.*.metric
}

output "this_alarm_rule_dimensions" {
  description = "Map of the resources associated with the alarm rule."
  value       = local.alarm_rule_dimensions
}

output "this_alarm_rule_period" {
  description = "Index query cycle."
  value       = alicloud_cms_alarm.cms.*.period
}

output "this_alarm_rule_statistics" {
  description = "Statistical method."
  value       = alicloud_cms_alarm.cms.*.statistics
}

output "this_alarm_rule_operator" {
  description = "Alarm comparison operator."
  value       = alicloud_cms_alarm.cms.*.operator
}

output "this_alarm_rule_threshold" {
  description = "Alarm threshold value."
  value       = alicloud_cms_alarm.cms.*.threshold
}

output "this_alarm_rule_triggered_count" {
  description = "Number of trigger alarm."
  value       = alicloud_cms_alarm.cms.*.triggered_count
}

output "this_alarm_rule_contact_groups" {
  description = "List contact groups of the alarm rule."
  value       = alicloud_cms_alarm.cms.*.contact_groups
}

output "this_alarm_rule_silence_time" {
  description = " Notification silence period in the alarm state."
  value       = alicloud_cms_alarm.cms.*.silence_time
}

output "this_alarm_rule_enabled" {
  description = "Whether to enable alarm rule."
  value       = alicloud_cms_alarm.cms.*.enabled
}

output "this_alarm_rule_webhook" {
  description = "The webhook that is called when the alarm is triggered."
  value       = alicloud_cms_alarm.cms.*.webhook
}

output "this_alarm_rule_status" {
  description = "The alarm rule status."
  value       = alicloud_cms_alarm.cms.*.status
}

