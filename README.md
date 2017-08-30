Alicloud VPC And VSwitch Terraform Module
tf_alicloud_vpc
=========================================

A terraform module to provide an Alicloud VPC cluster.

- The module contains one VPC and several VSwitches.
- If VPC is not specified, the module will launch a new one using its own parameters.
- The number of VSwitch depends on the length of the parameter `vswitch_cidr`.
- If you have no idea availability zones, the module will provide default values according to `cpu_core_count` and `memory_size`.



Module Input Variables
----------------------

The module aim to create a VPC cluster. Its input variables contains VPC, VSwitch and retrieving availability zones.

#### Common Input Vairables

- `alicloud_access_key` - The Alicloud Access Key ID to launch resources
- `alicloud_secret_key` - The Alicloud Access Secret Key to launch resources
- `region` - The region to launch resources - default to "cn-hongkong"
- `availability_zones` - List of availability zone IDs to launch several VSwitches in the different zones
                         and its item is "" means the value will be from zones' data source - default to [""]
- `number_format` - The number format used to mark multiple resources - default to "%02d"

#### VPC Input variables

- `vpc_id` - VPC ID to launch a new VSwitch and Security Group
- `vpc_cidr` - VPC CIDR block to launch a new VPC when `vpc_id` is not specified - default to "172.16.0.0/12"
- `vpc_name` - VPC name to mark a new VPC when `vpc_id` is not specified - default to "TF-VPC"
- `vpc_description` - VPC description used to launch a new vpc when 'vpc_id' is not specified - default to "A new VPC created by Terrafrom module tf-alicloud-vpc-cluster"

#### VSwitch Input Variables

- `vswitch_name` - VSwitch name prefix to mark a new VSwitch - default to "TF_VSwitch"
- `vswitch_cidrs` - List of VSwitch CIDR blocks to launch several new VSwitches
- `vswitch_description` - VSwitch description used to describe new vswitch - default to "New VSwitch created by Terrafrom module tf-alicloud-vpc-cluster."


Usage
-----
You can use this in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. main.tf

       module "tf-vpc-cluster" {
          source = "github.com/terraform-community-modules/tf-alicloud-ecs-instance"

          alicloud_access_key = "${var.alicloud_access_key}"
          alicloud_secret_key = "${var.alicloud_secret_key}"

          vpc_name = "my_module_vpc"

          vswitch_name = "my_module_vswitch"
          vswitch_cidr = [
             "172.16.1.0/24",
             "172.16.2.0/24"
          ]

        }

2. Setting values for the following variables, either through terraform.tfvars or environment variables or -var arguments on the CLI

- alicloud_access_key
- alicloud_secret_key

Module Output Variables
-----------------------

- vpc_id - A new VPC ID
- vswitch_ids - A list of new VSwitch IDs
- availability_zones - A list of zone IDs in which new vswitches

Authors
-------
Created and maintained by He Guimin(@xiaozhu36 heguimin36@163.com)

License
-------
Apache 2 Licensed. See LICENSE for full details.