output "serverip" {
  value = openstack_compute_instance_v2.mtc-test.access_ip_v4
}
