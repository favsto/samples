# Create the privatenet network
resource "google_compute_network" "privatenet" {
  name                    = "privatenet"
  auto_create_subnetworks = "true"
}

# Create a firewall rule to allow HTTP, SSH, RDP and ICMP traffic on privatenet
resource "google_compute_firewall" "privatenet_allow_http_ssh_rdp_icmp" {
  name    = "privatenet-allow-http-ssh-rdp-icmp"
  network = google_compute_network.privatenet.self_link
  allow {
    protocol = "tcp"
    ports    = ["22", "80", "3389"]
  }
  allow {
    protocol = "icmp"
  }
}

# Create the privatenet-us-vm instance
module "privatenet-us-vm" {
  source              = "./instance"
  instance_name       = "privatenet-us-vm"
  instance_zone       = "us-central1-a"
  instance_subnetwork = google_compute_network.privatenet.self_link
}

# Create the privatenet-eu-vm" instance
module "privatenet-eu-vm" {
  source              = "./instance"
  instance_name       = "privatenet-eu-vm"
  instance_zone       = "europe-west1-d"
  instance_subnetwork = google_compute_network.privatenet.self_link
}