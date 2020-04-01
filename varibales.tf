#################
# Provider
#################

variable "profile" {
  description = "The profile name as set in the shared credentials file. If not set, it will be sourced from the ALICLOUD_PROFILE environment variable."
  type        = string
  default     = ""
}

variable "shared_credentials_file" {
  description = "This is the path to the shared credentials file. If this is not set and a profile is specified, $HOME/.aliyun/config.json will be used."
  type        = string
  default     = ""
}

variable "region" {
  description = "The region used to launch this module resources."
  type        = string
  default     = ""
}

variable "skip_region_validation" {
  description = "Skip static validation of region ID. Used by users of alternative AlibabaCloud-like APIs or users w/ access to regions that are not public (yet)."
  type        = bool
  default     = false
}

#############
# cms alarm
#############

variable "alarm_rule_name" {
  description = "The alarm rule name."
  type        = string
  default     = "YourAlarmName"
}

variable "alarm_rule_project" {
  description = "Monitor project name, such as 'acs_ecs_dashboard' and 'acs_rds_dashboard'. For more information, see [Metrics Reference](https://www.alibabacloud.com/help/doc-detail/28619.htm)."
  type        = string
  default     = ""
}

variable "alarm_rule_metric" {
  description = "Name of the monitoring metrics corresponding to a project, such as 'CPUUtilization' and 'networkin_rate'. For more information, see [Metrics Reference](https://www.alibabacloud.com/help/doc-detail/28619.htm)."
  type        = string
  default     = ""
}

variable "alarm_rule_dimensions" {
  description = "Map of the resources associated with the alarm rule, such as 'instanceId', 'device' and 'port'. Each key's value is a string and it uses comma to split multiple items. For more information, see [Metrics Reference](https://www.alibabacloud.com/help/doc-detail/28619.htm)."
  type        = list(object({
    instanceId = string
    device  = string
  }))
  default     = []
}

variable "alarm_rule_period" {
  description = "Index query cycle, which must be consistent with that defined for metrics. Default to 300, in seconds."
  type        = number
  default     = 300
}

variable "alarm_rule_statistics" {
  description = "Statistical method. It must be consistent with that defined for metrics. Valid values: ['Average', 'Minimum', 'Maximum']. Default to 'Average'."
  type        = string
  default     = "Average"
}

variable "alarm_rule_operator" {
  description = "Alarm comparison operator. Valid values: ['<=', '<', '>', '>=', '==''', '!=']. Default to '=='."
  type        = string
  default     = "=="
}

variable "alarm_rule_threshold" {
  description = " Alarm threshold value, which must be a numeric value currently."
  type        = number
  default     = 35
}

variable "alarm_rule_triggered_count" {
  description = "Number of consecutive times it has been detected that the values exceed the threshold. Default to 3."
  type        = number
  default     = 3
}

variable "alarm_rule_contact_groups" {
  description = " List contact groups of the alarm rule, which must have been created on the console."
  type        = list(string)
  default     = []
}

variable "alarm_rule_effective_interval" {
  description = "The interval of effecting alarm rule. It foramt as 'hh:mm-hh:mm', like '0:00-4:00'. Default to '0:00-24:00'."
  type        = string
  default     = "0:00-24:00"
}

variable "alarm_rule_silence_time" {
  description = " Notification silence period in the alarm state, in seconds. Valid value range: [300, 86400]. Default to 86400."
  type        = number
  default     = 86400
}

variable "enabled_alarm_rule" {
  description = "Whether to enable alarm rule. Default to true."
  type        = bool
  default     = true
}

variable "alarm_rule_webhook" {
  description = "he webhook that should be called when the alarm is triggered. Currently, only http protocol is supported. Default is empty string."
  type        = string
  default     = ""
}

variable "existing_instance_id" {
  description = "The Id of an existing instance. If set, the `create_instance` will be ignored."
  type        = string
  default     = ""
}

variable "create_instance" {
  description = "Whether to create instance. If false, you can use a existing cms instance by setting `existing_instance_id`."
  type        = bool
  default     = true
}

variable "using_existing_id" {
  description = "Whether to create instance. If false, you can specify an existing cms instance."
  type        = bool
  default     = false
}