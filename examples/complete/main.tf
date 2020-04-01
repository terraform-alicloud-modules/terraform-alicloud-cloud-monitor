variable "region" {
  default = "cn-beijing"
}
variable "profile" {
  default = "default"
}
provider "alicloud" {
  region  = var.region
  profile = var.profile
}

module "cms" {
  source  = "../.."
  region  = var.region
  profile = var.profile

  alarm_rule_metric    = "disk_writebytes"
  alarm_rule_name      = "tf-testAccCmsAlarm_basic"
  alarm_rule_project   = "acs_ecs_dashboard"
  alarm_rule_threshold = 35
  alarm_rule_dimensions = [{
    instanceId = "i-bp1247,i-bp11gd"
    device     = "/dev/vda1,/dev/vdb1"
    },
    {
      instanceId = "i-bp1233,i-bp12gd"
      device     = "/dev/vda1,/dev/vdb1"
    }
  ]
  alarm_rule_period             = 900
  alarm_rule_statistics         = "Average"
  alarm_rule_operator           = "<="
  alarm_rule_triggered_count    = 2
  alarm_rule_contact_groups     = ["AccCms"]
  alarm_rule_effective_interval = "0:00-2:00"
}