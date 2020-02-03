variable "instance_name" {}
variable "instance_zone" {}
variable "instance_type" {
  default = "n1-standard-1"
}
variable "instance_subnetwork" {}
variable "instance_image" {
  default = "debian-cloud/debian-9"
}
variable "avoid-external-ip" {
  default = false
}
variable "network-tags" {
  type = "list"
  default = []
}

resource "google_compute_instance" "vm_instance" {
  name         = "${var.instance_name}"
  zone         = "${var.instance_zone}"
  machine_type = "${var.instance_type}"
  tags = var.network-tags

  boot_disk {
    initialize_params {
      image = "${var.instance_image}"
    }
  }

  network_interface {
    subnetwork = "${var.instance_subnetwork}"

    # this is a workaround to let this block conditional
    dynamic "access_config" {
      for_each = var.avoid-external-ip == false ? [""] : [] 
      content {
        nat_ip = ""
      }
    }
  }
}