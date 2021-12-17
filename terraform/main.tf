provider "openstack" {
  user_name   = var.user_name
  password    = var.password
  tenant_name = var.tenant_name

  auth_url    = var.auth_url
  region      = var.region
  domain_name = var.domain_name
}

resource "openstack_compute_instance_v2" "mtc-test" {
  # count       = 1
  name        = var.instance_name
  image_name  = var.image_name
  flavor_name = var.flavor_name
  key_pair    = var.key_pair

  network {
    name = "provider_net_cci_4"
  }

  connection {
    type        = "ssh"
    user        = "fedora"
    host        = self.access_ip_v4
    private_key = file(var.ssh_key)
    agent       = false
  }

  provisioner "remote-exec" {
    inline = ["echo Connected to the server"]
  }

  provisioner "local-exec" {
    command = "cd ..; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u fedora -i '${self.access_ip_v4},' --private-key ${var.ssh_key}  playbooks/config_slave.yml"
  }
}
