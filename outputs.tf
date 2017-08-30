// Output the IDs of the ECS instances created
output "vpc_id" {
  value = "${var.vpc_id == "" ? join(",", alicloud_vpc.vpc.*.id) : var.vpc_id}"
}

output "vswitch_ids" {
  value = "${join(",", alicloud_vswitch.vswitches.*.id)}"
}

output "availability_zones" {
  value = "${join(",", alicloud_vswitch.vswitches.*.availablity_zone)}"
}