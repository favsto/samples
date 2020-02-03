# Cloud NAT
variable "region" {}
variable "subnetwork" {}

resource "google_compute_address" "nat-ip" {
  name    = "nat-ip"
  region  = "${var.region}"
}
resource "google_compute_router" "nat-router" {
  name = "bastion-nat-router"
  region  = "${var.region}"
  network = "${var.subnetwork}"
}
resource "google_compute_router_nat" "nat-server" {
  name = "bast-nat-gw"
  region  = "${var.region}"
  router = "${google_compute_router.nat-router.name}"
  nat_ip_allocate_option = "MANUAL_ONLY"
  nat_ips = ["${google_compute_address.nat-ip.self_link}"]
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  depends_on = [ "google_compute_address.nat-ip",  "google_compute_router.nat-router"]
}