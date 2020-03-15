Terraform module for creating Cloud Monitor (CMS) resources on Alibaba Cloud.  
terraform-alicloud-cloud-monitor
-------------------------------

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-cloud-monitor/blob/master/README-CN.md)

Terraform module which creates Cloud Monitor (CMS) resources on Alibaba Cloud. 

These types of resources are supported:

* [alicloud_cms_alarm Instance](https://www.terraform.io/docs/providers/alicloud/r/cms_alarm.html)

## Terraform versions

This module requires Terraform 0.12 and Terraform Provider AliCloud 1.57.0+.

## Usage

```hcl
module "cms"  {
  source  = "terraform-alicloud-modules/cloud-monitor/alicloud"
  region                     = "cn-beijing"                
  profile                    = "Your-Profile-Name"
  
  alarm_rule_metric    = "disk_writebytes"
  alarm_rule_name      = "tf-testAccCmsAlarm_basic"
  alarm_rule_project   = "acs_ecs_dashboard"
  alarm_rule_threshold = 35
  alarm_rule_dimensions = {
    instanceId = "i-bp1247xxx,i-bp11gdxxx"
    device     = "/dev/vda1,/dev/vdb1"
  }
  alarm_rule_period             = 900
  alarm_rule_statistics         = "Average"
  alarm_rule_operator           = "<="
  alarm_rule_triggered_count    = 2
  alarm_rule_contact_groups     = ["AccCms"]
  alarm_rule_effective_interval = "0:00-2:00"
}
```

## Examples

* [complete](https://github.com/terraform-alicloud-modules/terraform-alicloud-cloud-monitor/tree/master/examples/complete)

## Notes

* This module using AccessKey and SecretKey are from `profile` and `shared_credentials_file`.
If you have not set them yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.

Submit Issues
-------------
If you have any problems when using this module, please opening a [provider issue](https://github.com/terraform-providers/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend to open an issue on this repo.

Authors
-------
Created and maintained by He Guimin(@xiaozhu36, heguimin36@163.com) and Yi Jincheng(yi785301535@163.com) 

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)

