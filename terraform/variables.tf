variable "user_name" {
  description = "User name that is used for login OpenStack"
}

variable "password" {
  description = "Password that is used for login OpenStack"
}

variable "flavor_name" {
  default = "migration-qe-ssd.standard.large"
}

variable "auth_url" {
  default = "https://rhos-d.infra.prod.upshift.rdu2.redhat.com:13000"
}

variable "tenant_name" {
  default = "Migration QE"
}

variable "region" {
  default = "regionOne"
}

variable "domain_name" {
  default = "redhat.com"
}

variable "ssh_key" {
  description = "ssh private key for VM access"
}

variable "image_name" {
  default = "Fedora-Cloud-Base-32"
}

variable "instance_name" {
  default = "mtc-slave-vm"
}

variable "key_pair" {
  type = string
  default = "openshift-qe"
}