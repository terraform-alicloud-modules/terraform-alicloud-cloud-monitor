terraform-alicloud-cloud-monitor/
=====================================================================

本 Terraform 模块将用于在阿里云上创建云监控（CMS）。

## Terraform 版本

本模板要求使用版本 Terraform 0.12 和 阿里云 Provider 1.57.0+。

## 用法

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
    instanceId = "i-bp124xxx7,i-bp11gdxxx"
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

## 示例

* [在创建cms 示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-cloud-monitor/tree/master/examples/complete)

## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file` 中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置。

提交问题
------
如果在使用该 Terraform Module 的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/terraform-providers/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

作者
-------
Created and maintained by Yi Jincheng(yi785301535@163.com) and He Guimin(@xiaozhu36, heguimin36@163.com)

许可
----
Apache 2 Licensed. See LICENSE for full details.

参考
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
